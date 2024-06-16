import 'dart:convert';
import 'package:dozer_mobile/core/data/apis/api_end_points.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/presentation/profile_screen/models/profile_model.dart';

class ProfileRepository {
  final String apiUrl = ApiEndPoints.baseUrl + ApiEndPoints.profile;
  final NetworkApiService _apiService = NetworkApiService();

  Future<Profile> getProfile(String id) async {
    try {
      final String profileId = GetStorageHelper.getValue("profileId") ?? "";
      print('Profile ID: $profileId');
      print('Fetching profile... $apiUrl/$id');
      final dynamic response = await _apiService.getResponse('$apiUrl/$id');
      print('Response in profile: $response');

      if (response == null) {
        throw Exception('Null response received.');
      }

      final dynamic responseBody =
          response is String ? jsonDecode(response) : response;
      print('Response body in profile: $responseBody');

      if (responseBody == null) {
        throw Exception('Invalid JSON format.');
      }

      if (responseBody['status'] == 'success') {
        final Map<String, dynamic> json = responseBody['formattedProfile'];
        print('Json in profile: $json');
        print('***************************');
        print(Profile.fromJson(json).email);
        return Profile.fromJson(json);
      } else {
        throw Exception(
            'Failed to load profile. Status: ${responseBody['status']}');
      }
    } catch (error) {
      print('Error fetching profile: $error');
      throw Exception('Failed to load profile');
    }
  }

  Future<Profile> createProfile({
    required String firstName,
    required String middleName,
    required String lastName,
    required String jobTitle,
    required String image,
  }) async {
    try {
      final Map<String, dynamic> profileData = {
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'jobTitle': jobTitle,
        'image': image,
      };

      final dynamic response =
          await _apiService.postResponse(apiUrl, profileData);

      if (response == null) {
        throw Exception('Null response received.');
      }

      final dynamic responseBody =
          response is String ? jsonDecode(response) : response;

      if (responseBody == null) {
        throw Exception('Invalid JSON format.');
      }

      if (responseBody['status'] == 'success') {
        final Map<String, dynamic> json = responseBody['data'];
        return Profile.fromJson(json);
      } else {
        throw Exception(
            'Failed to create profile. Status: ${responseBody['status']}');
      }
    } catch (error) {
      print('Error creating profile: $error');
      throw Exception('Failed to create profile');
    }
  }

  Future<Profile> updateProfile(
    String profileId, {
    required String firstName,
    required String middleName,
    required String lastName,
    required String jobTitle,
    required String image,
  }) async {
    try {
      final Map<String, dynamic> profileData = {
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'jobTitle': jobTitle,
        'image': image,
      };

      final dynamic response =
          await _apiService.putResponse('$apiUrl/$profileId', profileData);

      if (response == null) {
        throw Exception('Null response received.');
      }

      final dynamic responseBody =
          response is String ? jsonDecode(response) : response;

      if (responseBody == null) {
        throw Exception('Invalid JSON format.');
      }

      if (responseBody['status'] == 'success') {
        final Map<String, dynamic> json = responseBody['data'];
        return Profile.fromJson(json);
      } else {
        throw Exception(
            'Failed to update profile. Status: ${responseBody['status']}');
      }
    } catch (error) {
      print('Error updating profile: $error');
      throw Exception('Failed to update profile');
    }
  }
}
