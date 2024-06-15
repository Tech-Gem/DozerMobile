import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/presentation/profile_screen/models/profile_model.dart';
import 'package:dozer_mobile/presentation/profile_screen/repository/profile_repository.dart';
import 'package:get/get.dart';

enum Status { loading, success, error }

class ProfileController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();
  Rx<Profile?> profile = Rx<Profile?>(null);
  Rx<Status> status = Status.loading.obs;
  // final String id = "bbde3538-5ba2-4b5c-9034-aa07ba83c9a4";
  final String profileId = GetStorageHelper.getValue("profileId") ?? "";
  final String userId = GetStorageHelper.getValue("userId") ?? "";
  final String tokenn = GetStorageHelper.getValue("token") ?? "";

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    print("############# user token${tokenn}");
    print("############# user id${userId}");
    print("############# user profile id${profileId}");
    try {
      status(Status.loading);
      final result = await _repository.getProfile(profileId);
      print("#############${result.email}");
      profile(result);
      print("#############${result.email}");
      status(Status.success);
    } catch (error) {
      print('Error fetching profile: $error');
      status(Status.error);
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
      print("Profile created: ${result.firstName} ${result.lastName}");
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
        userId,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        jobTitle: jobTitle,
        image: image,
      );
      profile(result);
      print("Profile updated: ${result.firstName} ${result.lastName}");
      status(Status.success);
    } catch (error) {
      print('Error updating profile: $error');
      status(Status.error);
    }
  }
}
