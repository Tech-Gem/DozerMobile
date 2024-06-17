import 'package:dozer_mobile/core/data/apis/api_response_status.dart';

import 'package:dozer_mobile/presentation/notification/repositories/notification_repository.dart';
import 'package:dozer_mobile/presentation/user_notification/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final NotificationRepository repository = NotificationRepository();

  RxList<NotificationModel> notifications = <NotificationModel>[].obs; // Define notifications list
  var message = ''.obs;
  var notificationType = ''.obs;
  var bookingId = ''.obs;
  var bookingStatus = ''.obs;
  Rx<Status> status = Status.completed.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null) {
      setArguments(arguments);
    }
    loadNotifications(); // Load notifications on initialization
  }

  void setArguments(Map pushArguments) {
    if (pushArguments.containsKey('message') &&
        pushArguments['message'] is Map) {
      final messageMap = pushArguments['message'] as Map;
      notificationType.value = messageMap['type'] ?? '';
      bookingStatus.value = messageMap['status'] ?? '';
      bookingId.value = messageMap['bookingId'] ?? '';
      message.value =
          getMessageForType(notificationType.value, bookingStatus.value);
    }
  }

  String getMessageForType(String? type, String? status) {
    switch (type) {
      case 'BookingRequest':
        return 'You have a new booking request.';
      case 'BookingStatus':
        if (status == 'Confirmed') {
          return 'Your booking has been confirmed.';
        } else if (status == 'Rejected') {
          return 'Your booking has been rejected.';
        } else {
          return 'Your booking status has been updated.';
        }
      default:
        return 'You have a new notification.';
    }
  }

  void loadNotifications() async {
    try {
      status(Status.loading); // Set loading status
      final fetchedNotifications = await repository.fetchNotifications();

      if (fetchedNotifications.isNotEmpty) {
        notifications.assignAll(fetchedNotifications);
        status(Status.completed); // Set success status
      } else {
        status(Status.error); // Set error status
        print('Error loading notifications: Empty response');
      }
    } catch (e) {
      status(Status.error); // Set error status
      print('Error loading notifications: $e');
    }
  }

  Future<void> handleBookingAction(String status) async {
    this.status.value = Status.loading;
    final success =
        await repository.confirmOrRejectBooking(bookingId.value, status);
    if (success) {
      this.status.value = Status.completed;
      Get.offNamed('/home');
    } else {
      this.status.value = Status.error;
    }
  }
}
