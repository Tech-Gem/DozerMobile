import 'package:dozer_mobile/presentation/notification/repositories/notification_repository.dart';
import 'package:dozer_mobile/presentation/user_notification/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final NotificationRepository _repository = NotificationRepository();
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;
  Rx<Status> status = Status.loading.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() async {
    try {
      status(Status.loading); // Set loading status
      final fetchedNotifications = await _repository.fetchNotifications();

      if (fetchedNotifications != null) {
        // Check if fetchedNotifications is not null
        if (fetchedNotifications.isNotEmpty) {
          notifications.assignAll(fetchedNotifications);
          status(Status.success); // Set success status
        } else {
          // Empty response, treat as success
          status(Status.success);
        }
      } else {
        // Null response, treat as error
        throw Exception('Empty response');
      }
    } catch (e) {
      status(Status.error); // Set error status
      print('Error loading notifications: $e');
    }
  }
}

enum Status { loading, success, error }
