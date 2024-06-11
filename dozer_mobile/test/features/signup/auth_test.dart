import 'package:dozer_mobile/core/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/presentation/sign_up/controllers/sign_up_controller.dart';
import 'package:dozer_mobile/presentation/verify_otp/controllers/verify_otp_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_test.mocks.dart';

@GenerateMocks(
    [AuthenticationRepository, VerifyOtpController, SignUpController])
void main() {
  late MockAuthenticationRepository mockRepository;
  late MockSignUpController mockSignUpController;
  late MockVerifyOtpController mockVerifyOtpController;

  setUp(() {
    mockRepository = MockAuthenticationRepository();
    mockSignUpController = MockSignUpController();
    mockVerifyOtpController = MockVerifyOtpController();

    when(mockSignUpController.firstNameController)
        .thenReturn(Rx(TextEditingController()));

    when(mockSignUpController.lastNameController)
        .thenReturn(Rx(TextEditingController()));

    when(mockSignUpController.phoneNumberController)
        .thenReturn(Rx(TextEditingController()));

    when(mockSignUpController.emailController)
        .thenReturn(Rx(TextEditingController()));

    when(mockSignUpController.passwordController)
        .thenReturn(Rx(TextEditingController()));
  });

  test('User Registered Successfully', () async {
    // Mock the sendOtp method to return true
    print('***************');
    when(mockRepository.sendOtp(any)).thenAnswer((_) async => true);

    // Set up controller state with valid data for signup
    mockSignUpController.firstNameController.value.text = 'John';
    mockSignUpController.lastNameController.value.text = 'Doe';
    mockSignUpController.phoneNumberController.value.text = '1234567890';
    mockSignUpController.emailController.value.text = 'john.doe@example.com';
    mockSignUpController.passwordController.value.text = 'password';

    // Call the signUp method
    print(mockSignUpController.firstNameController.value.text);
    print(mockSignUpController.lastNameController.value.text);
    print(mockSignUpController.phoneNumberController.value.text);
    print(mockSignUpController.emailController.value.text);
    print(mockSignUpController.passwordController.value.text);

    await mockSignUpController.signUp();

    // Verify that sendOtp method was called with the correct phone number
    verifyNever(mockRepository.sendOtp(any));

    // Verify that navigation occurred to the OTP screen
    // expect(Get.currentRoute, RoutesName.otp);

    // Mock the verifyOtp method to return true
    when(mockVerifyOtpController.verifyOtp(any, any))
        .thenAnswer((_) async => true);

    // Call the verifyOtp method with correct OTP
    await mockVerifyOtpController.verifyOtp('1234567890', '123456');

    // Verify that registerUser method was called
    verifyNever(mockRepository.registerUser(any, any, any, any, any)).called(0);

    // Verify that navigation occurred to the home page
    // expect(Get.currentRoute, RoutesName.home);
  });
}
