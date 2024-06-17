import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/presentation/notification/repositories/notification_repository.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final NotificationRepository repository = NotificationRepository();

  var message = ''.obs;
  var notificationType = ''.obs;
  var bookingId = ''.obs;
  var bookingStatus = ''.obs; // Add bookingStatus
  Rx<Status> status = Status.completed.obs; // Add status

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null) {
      setArguments(arguments);
    }
  }

  void setArguments(Map pushArguments) {
    if (pushArguments.containsKey('message') &&
        pushArguments['message'] is Map) {
      final messageMap = pushArguments['message'] as Map;
      notificationType.value = messageMap['type'] ?? '';
      bookingStatus.value = messageMap['status'] ?? ''; // Update bookingStatus
      bookingId.value =
          messageMap['bookingId'] ?? ''; // Ensure bookingId is set
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
