import 'package:dozer_mobile/pages/verify_otp/controllers/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class VerifyOtpPage extends StatelessWidget {
  final VerifyOtpController _controller = Get.put(VerifyOtpController());

  VerifyOtpPage({Key? key}); // Register the controller

  @override
  Widget build(BuildContext context) {
    RxString enteredOtp = ''.obs; // Variable to store entered OTP

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter A 6 digit number that was sent to contact',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: OtpPinField(
                          textInputAction: TextInputAction.done,
                          maxLength: 6,
                          fieldWidth: 40,
                          onSubmit: (text) {
                            enteredOtp.value = text; // Capture entered OTP
                          },
                          onChange: (text) {},
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (enteredOtp.value.length != 6) {
                            Get.snackbar('Error', 'Please enter 6 digit OTP');
                          } else {
                            _controller.verifyOtp(enteredOtp
                                .value); // Call verifyOtp method of the controller with entered OTP
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 253, 188, 51),
                            borderRadius: BorderRadius.circular(36),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Verify',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}