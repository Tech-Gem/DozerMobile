import 'package:dozer_mobile/data/apis/api_end_points.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository {
  Future<bool> sendOtp(String phoneNumber) async {
    try {
      debugPrint('phone number: $phoneNumber');
      final response = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.sendOtp),
        body: {'phoneNumber': phoneNumber},
      );
      debugPrint('response: ${response.statusCode}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error sending OTP: $e');
      return false;
    }
  }

  Future<bool> verifyOtp(String otp) async {
    try {
      final response = await http.post(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.verifyOtp),
          body: {'code': otp});
      debugPrint('response: ${response.statusCode}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      return false;
    }
  }

  Future<bool> resendOtp(String phoneNumber) async {
    try {
      final response = await http.post(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.resendOtp),
          body: {'phoneNumber': phoneNumber});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error resending OTP: $e');
      return false;
    }
  }

  Future<bool> registerUser(String fullName, String email, String phoneNumber,
      String password) async {
    try {
      final response = await http.post(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.registerUser),
          body: {
            'phoneNumber': phoneNumber,
            'email': email,
            'password': password,
            'fullName': fullName,
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error registering user: $e');
      return false;
    }
  }
}
