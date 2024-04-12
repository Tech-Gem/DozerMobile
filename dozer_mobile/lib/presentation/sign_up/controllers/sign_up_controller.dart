import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/data/apis/api_response_status.dart';
import 'package:dozer_mobile/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final AuthenticationRepository _repository = AuthenticationRepository();

  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final fullNameError = RxString('');
  final phoneNumberError = RxString('');
  final emailError = RxString('');
  final passwordError = RxString('');
  final Rx<Status> status = Status.completed.obs;

  final RxBool passwordVisibility = false.obs;

  Future<void> signUp() async {
    final fullName = fullNameController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (validateFields(fullName, phoneNumber, email, password)) {
      try {
        status(Status.loading);
        final isOtpSent = await _repository.sendOtp(phoneNumber);

        if (isOtpSent) {
          Get.toNamed(RoutesName.otp);
          status(Status.completed);
        } else {
          Get.snackbar('Error', 'Failed to send OTP');
        }
      } catch (e) {
        Get.snackbar('Error', 'Failed to send OTP: $e');
      }
    }
  }

  bool validateFields(
      String fullName, String phoneNumber, String email, String password) {
    bool isValid = true;

    if (fullName.isEmpty) {
      fullNameError.value = 'Please enter your full name';
      isValid = false;
    } else {
      fullNameError.value = '';
    }

    if (phoneNumber.isEmpty) {
      phoneNumberError.value = 'Please enter your phone number';
      isValid = false;
    } else if (!_isEthiopianPhoneNumber(phoneNumber)) {
      phoneNumberError.value = 'Please enter a valid Ethiopian phone number';
      isValid = false;
    } else {
      phoneNumberError.value = '';
    }

    if (email.isEmpty) {
      emailError.value = 'Please enter your email';
      isValid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Please enter a valid email';
      isValid = false;
    } else {
      emailError.value = '';
    }

    if (password.isEmpty) {
      passwordError.value = 'Please enter your password';
      isValid = false;
    } else if (password.length < 8) {
      passwordError.value = 'Password should be at least 8 characters';
      isValid = false;
    } else {
      passwordError.value = '';
    }

    return isValid;
  }

  bool _isEthiopianPhoneNumber(String phoneNumber) {
    const pattern = r'^(?:\+?251|0)?9[0-9]{8}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(phoneNumber);
  }

  void togglePasswordVisibility() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  @override
  void onClose() {
    // Clean up the text controllers when the controller is closed
    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
