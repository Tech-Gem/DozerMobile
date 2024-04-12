import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/data/apis/api_response_status.dart';
import 'package:dozer_mobile/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Rx<Status> status = Status.completed.obs;
  final RxString phoneNumberError = RxString('');
  final RxString passwordError = RxString('');
  final RxBool passwordVisibility = true.obs;

  bool get isLoginEnabled =>
      phoneNumberController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      phoneNumberError.value.isEmpty &&
      passwordError.value.isEmpty;

  void togglePasswordVisibility() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  void validatePhoneNumber(String value) {
    // Regular expression for phone number validation
    final phoneRegex = RegExp(r'^(?:\+?251|0)?9[0-9]{8}$');
    if (value.isEmpty) {
      phoneNumberError.value = 'Phone number cannot be empty';
    } else if (!phoneRegex.hasMatch(value)) {
      phoneNumberError.value = 'Enter a valid phone number';
    } else {
      phoneNumberError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = '';
    }
  }

  Future<void> login() async {
    try {
      if (!isLoginEnabled) return;

      status(Status.loading);

      final response = await _authRepository.login(
        phoneNumberController.text.trim(),
        passwordController.text.trim(),
      );

      if (response) {
        Get.toNamed(RoutesName.home);
      } else {
        Get.snackbar(
            'Error', 'Failed to login. Please check your credentials.');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      status(Status.completed);
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
