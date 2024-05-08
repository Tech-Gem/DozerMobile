import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/data/apis/api_response_status.dart';
import 'package:dozer_mobile/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/presentation/sign_up/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final AuthenticationRepository _repository = AuthenticationRepository();
  final Rx<Status> verificationStatus = Status.completed.obs;
  final SignUpController signUpController = Get.find<SignUpController>();

  // Method to verify OTP
  Future<void> verifyOtp(String phoneNumber, String code) async {
    try {
      verificationStatus(Status.loading);
      debugPrint(phoneNumber);
      debugPrint(code);
      final bool isVerified = await _repository.verifyOtp(phoneNumber, code);

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
      final bool isRegistered = await _repository.registerUser(
        signUpController.phoneNumberController.value.text, // Example fullName from
        signUpController.emailController.value.text, // Example email
        signUpController.passwordController.value.text, // Example phone number
        signUpController.firstNameController.value.text, // Example password
         signUpController.lastNameController.value.text, // Example password
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
          .resendOtp(signUpController.phoneNumberController.value.text.trim());
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
