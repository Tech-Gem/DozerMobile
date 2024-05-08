import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/data/apis/api_end_points.dart';
import 'package:http/http.dart' as http;
  import 'dart:convert'; // Make sure to import this for JSON parsing

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



Future<bool> registerUser(String phoneNumber, String email, String password, String firstName,String lastName) async {
  try {
    final response = await http.post(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.registerUser),
      body: {
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName
      },
    );
    
    if (response.statusCode == 201) {
      // Parse the JSON response
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      
      // Access the token, email, and name from the parsed response
      String token = jsonResponse["token"];
      String userEmail = jsonResponse["user"]["email"];
      String userName = jsonResponse["userProfile"]["firstName"];
      
      // Store the token using GetStorageHelper or perform any other operations
      await GetStorageHelper.addValue("token", token);
      await   GetStorageHelper.addValue("email", userEmail);
        await  GetStorageHelper.addValue("userName", userName);
      
      return true;
    } else {
      print(response.body);
      return false;
    }
  } catch (e) {
    print(e.toString());
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
