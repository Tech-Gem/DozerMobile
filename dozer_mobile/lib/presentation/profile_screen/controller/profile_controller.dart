import 'dart:convert';
import 'dart:io';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/presentation/profile_screen/models/profile_model.dart';
import 'package:dozer_mobile/presentation/profile_screen/repository/profile_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

enum Status { loading, success, error }

class ProfileController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();
  Rx<Profile?> profile = Rx<Profile?>(null);
  Rx<Status> status = Status.loading.obs;
  final String profileId = GetStorageHelper.getValue("profileId") ?? "";
  final String userId = GetStorageHelper.getValue("userId") ?? "";
  final String tokenn = GetStorageHelper.getValue("token") ?? "";

  Rx<File?> selectedImage = Rx<File?>(null);
  RxString imageUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      status(Status.loading);
      final result = await _repository.getProfile(profileId);
      profile(result);
      status(Status.success);
    } catch (error) {
      print('Error fetching profile: $error');
      status(Status.error);
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> uploadImage() async {
    if (selectedImage.value == null) {
      throw Exception('No image selected');
    }

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dvzsaa0eo/upload');
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'pfnwlmxn'
      ..fields['folder'] = 'Equipment'
      ..files.add(
        await http.MultipartFile.fromPath('file', selectedImage.value!.path),
      );

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      imageUrl.value = jsonMap['url'];

      // Update profile with the new image URL
      updateProfile(
        firstName: profile.value!.firstName ?? '',
        middleName: profile.value!.middleName ?? '',
        lastName: profile.value!.lastName ?? '',
        jobTitle: profile.value!.jobTitle ?? '',
        image: imageUrl.value,
      );
    } else {
      throw Exception('Failed to upload image');
    }
  }

  void createProfile({
    required String firstName,
    required String middleName,
    required String lastName,
    required String jobTitle,
    required String image,
  }) async {
    try {
      status(Status.loading);
      final result = await _repository.createProfile(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        jobTitle: jobTitle,
        image: image,
      );
      profile(result);
      status(Status.success);
    } catch (error) {
      print('Error creating profile: $error');
      status(Status.error);
    }
  }

  void updateProfile({
    required String firstName,
    required String middleName,
    required String lastName,
    required String jobTitle,
    required String image,
  }) async {
    try {
      status(Status.loading);
      final result = await _repository.updateProfile(
        profileId,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        jobTitle: jobTitle,
        image: image,
      );
      profile(result);
      status(Status.success);
    } catch (error) {
      print('Error updating profile: $error');
      status(Status.error);
    }
  }
}
