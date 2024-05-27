

import 'package:dozer_mobile/presentation/profile_screen/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ProfileController.new);
  }
}
