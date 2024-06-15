import 'package:dozer_mobile/presentation/profile_screen/models/profile_model.dart';
import 'package:dozer_mobile/presentation/profile_screen/repository/profile_repository.dart';
import 'package:get/get.dart';

enum Status { loading, success, error }

class ProfileController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();
  Rx<Profile?> profile = Rx<Profile?>(null);
  Rx<Status> status = Status.loading.obs;
  final String id = "9c613077-4b41-4a10-8199-7e49193a1a23";

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      status(Status.loading);
      final result = await _repository.getProfile(id);
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
        id,
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
