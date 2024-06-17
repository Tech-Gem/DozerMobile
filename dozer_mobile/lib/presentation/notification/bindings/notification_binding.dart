import 'package:get/get.dart';
import 'package:dozer_mobile/presentation/notification/controllers/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
