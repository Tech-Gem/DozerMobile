import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/presentation/sign_up/controllers/sign_up_controller.dart';
import 'package:dozer_mobile/presentation/sign_up/screen_widgets/password_text_field.dart';
import 'package:dozer_mobile/core/utils/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // to give space from top
            const Expanded(
              flex: 1,
              child: Center(),
            ),

            // page content here
            Expanded(
              flex: 9,
              child: buildCard(size),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(Size size) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // header text
                  Text(
                    'Create Account',
                    style: GoogleFonts.inter(
                      fontSize: 24.0,
                      color: const Color(0xFF15224F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Let\'s create your account',
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: const Color(0xFF969AA8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),

                  // form fields
                  Obx(
                    () => CustomTextField(
                      controller: signUpController.firstNameController.value,
                      errorText: signUpController.fullNameError.value,
                      labelText: 'First Name',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => CustomTextField(
                      controller: signUpController.lastNameController.value,
                      errorText: signUpController.fullNameError.value,
                      labelText: 'Last Name',
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

                  // sign up button
                  ElevatedButton(
                    onPressed: signUpController.signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      minimumSize: Size(size.width, size.height / 11),
                    ),
                    child: Obx(
                      () => signUpController.status.value == Status.loading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Sign Up',
                              style: GoogleFonts.inter(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),

                  // footer section
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textColor,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Already have an account? ',
                        ),
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RoutesName.login);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
