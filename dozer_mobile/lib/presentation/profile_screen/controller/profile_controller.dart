import 'package:dozer_mobile/presentation/profile_screen/models/profile_model.dart';
import 'package:dozer_mobile/presentation/profile_screen/repository/profile_repository.dart';
import 'package:get/get.dart';

enum Status { loading, success, error }

class ProfileController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();
  Rx<Profile?> profile = Rx<Profile?>(null);
  Rx<Status> status = Status.loading.obs;
  final String id = "8a5bce3f-4667-498c-ac54-dfe40193378a";

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
}
