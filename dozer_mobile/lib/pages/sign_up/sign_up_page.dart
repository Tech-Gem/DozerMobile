import 'package:dozer_mobile/data/apis/api_response_status.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/pages/sign_up/controllers/sign_up_controller.dart';
import 'package:dozer_mobile/pages/sign_up/screen_widgets/password_text_field.dart';
import 'package:dozer_mobile/core/utils/widgets/text_field.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Create Account",
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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Let's create your account",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Tell us about yourself so that we get to know you.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(
                      () => CustomTextField(
                        controller: signUpController.fullNameController.value,
                        errorText: signUpController.fullNameError.value,
                        labelText: 'Full Name',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => CustomTextField(
                        controller: signUpController.emailController.value,
                        errorText: signUpController.emailError.value,
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => CustomTextField(
                        controller: signUpController.phoneNumberController.value,
                        errorText: signUpController.phoneNumberError.value,
                        labelText: 'Phone Number',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => PasswordField(
                        errorText: signUpController.passwordError.value,
                        labelText: 'Password',
                        controller: signUpController.passwordController.value,
                        isPasswordVisible:
                            signUpController.passwordVisibility.value,
                        onTap: signUpController.togglePasswordVisibility,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: signUpController.signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Obx(() => signUpController.status.value ==
                              Status.loading
                          ? CircularProgressIndicator(
                              color: AppColors.white,
                            ) // Show circular progress indicator when loading
                          : const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            )),
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
