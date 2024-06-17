import 'package:dozer_mobile/presentation/notification/repositories/notification_repository.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final NotificationRepository repository;
  NotificationController({required this.repository});

  var message = ''.obs;
  var notificationType = ''.obs;
  var bookingId = ''.obs;
  var isLoading = false.obs;

  void setArguments(Map pushArguments) {
    if (pushArguments.containsKey('message') &&
        pushArguments['message'] is Map) {
      final messageMap = pushArguments['message'] as Map;
      message.value = messageMap['content'] ?? '';
      notificationType.value = messageMap['type'] ?? '';
      bookingId.value = messageMap['bookingId'] ?? '';
    }
  }

  Future<void> handleBookingAction(String status) async {
    isLoading.value = true;
    final success = await repository.confirmOrRejectBooking(bookingId.value, status);
    isLoading.value = false;

    if (success) {
      Get.snackbar('Success', 'Booking $status successfully');
      Get.offNamed('/home');
    } else {
      Get.snackbar('Error', 'Failed to $status booking');
    }
  }
}
