import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/pages/login_screen/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/data/apis/api_response_status.dart';
import 'package:dozer_mobile/pages/sign_up/screen_widgets/password_text_field.dart';
import 'package:dozer_mobile/core/utils/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Log in to your account.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => CustomTextField(
                        controller: _loginController.phoneNumberController,
                        errorText: _loginController.phoneNumberError.value,
                        labelText: 'Phone Number',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => PasswordField(
                        errorText: _loginController.passwordError.value,
                        labelText: 'Password',
                        controller: _loginController.passwordController,
                        isPasswordVisible:
                            _loginController.passwordVisibility.value,
                        onTap: _loginController.togglePasswordVisibility,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loginController.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Obx(() => _loginController.status.value ==
                              Status.loading
                          ? CircularProgressIndicator(
                              color: AppColors.white,
                            ) // Show circular progress indicator when loading
                          : const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            )),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesName.forgotPassword);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
