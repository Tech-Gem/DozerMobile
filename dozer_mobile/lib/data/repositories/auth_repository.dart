import 'package:dozer_mobile/data/apis/api_end_points.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository {
  Future<bool> sendOtp(String phoneNumber) async {
    try {
      // debugPrint('phone number: $phoneNumber');
      final response = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.sendOtp),
        body: {'phoneNumber': phoneNumber},
      );
      // debugPrint('response: ${response.statusCode}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> verifyOtp(String phoneNumber, String code) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.verifyOtp),
        body: {'phoneNumber': phoneNumber, 'code': code},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
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
      return false;
    }
  }

  Future<bool> registerUser(String phoneNumber, String email, String password,
      String fullName) async {
    try {
      final response = await http.post(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.registerUser),
          body: {
            'phoneNumber': phoneNumber,
            'email': email,
            'password': password,
            'fullName': fullName,
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String phoneNumber, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.login),
        body: {'phoneNumber': phoneNumber, 'password': password},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> resetPassword(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.resetPassword),
        body: {'phoneNumber': phoneNumber},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
