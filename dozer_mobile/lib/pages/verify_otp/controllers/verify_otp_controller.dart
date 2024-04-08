import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/data/apis/api_response_status.dart';
import 'package:dozer_mobile/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/pages/sign_up/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final AuthenticationRepository _repository = AuthenticationRepository();
  final Rx<Status> verificationStatus = Status.completed.obs;
  final SignUpController signUpController = SignUpController();

  // Method to verify OTP
  Future<void> verifyOtp(String code) async {
    try {
      verificationStatus(Status.loading);
      final bool isVerified = await _repository.verifyOtp(code);
      if (isVerified) {
        registerUser();
      } else {
        Get.snackbar('Error', 'Failed to verify OTP');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify OTP: $e');
    }
  }

  // Method to register user
  Future<void> registerUser() async {
    try {
      verificationStatus(Status.loading);
      debugPrint(
          'Full Name: ${signUpController.fullNameController.text.trim()}');
      debugPrint(
          '********************************************************************');
      final bool isRegistered = await _repository.registerUser(
        signUpController.fullNameController.text
            .trim(), // Example fullName from
        signUpController.emailController.text.trim(), // Example email
        signUpController.phoneNumberController.text
            .trim(), // Example phone number
        signUpController.passwordController.text.trim(), // Example password
      );
      if (isRegistered) {
        // Navigate to the next screen or perform any other action
        Get.toNamed(RoutesName.home);
        verificationStatus(Status.completed);
      } else {
        Get.snackbar('Error', 'failed to register user');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify OTP: $e');
    }
  }

  Future<void> resendOtp() async {
    try {
      verificationStatus(Status.loading);
      final bool isResent = await _repository
          .resendOtp(signUpController.phoneNumberController.text.trim());
      if (isResent) {
        verificationStatus(Status.completed);
        Get.snackbar('Resend', 'Code resent successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else {
        Get.snackbar('Error', 'Failed to resend OTP');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to resend OTP: $e');
    }
  }
}