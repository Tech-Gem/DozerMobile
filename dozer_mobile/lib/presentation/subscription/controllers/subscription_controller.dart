import 'package:get/get.dart';

enum Status { loading, success, error }

class SubscriptionController extends GetxController {
  RxString selectedPlan = ''.obs;
  RxInt selectedDuration = 30.obs; // Default duration is 30 days
  Rx<Status> status = Status.loading.obs;

  void selectPlan(String plan) {
    selectedPlan(plan);
  }

  void selectDuration(int duration) {
    selectedDuration(duration);
  }

  void confirmSubscription() {
    if (selectedPlan.isNotEmpty) {
      // Handle subscription confirmation logic
      print(
          'Subscription confirmed for $selectedPlan with $selectedDuration days');
      Get.snackbar('Subscription',
          'You have selected the $selectedPlan plan for $selectedDuration days.');

      // Simulate a backend request
      Map<String, dynamic> subscriptionData = {
        "subscriptionType": selectedPlan.value,
        "subscriptionDuration": selectedDuration.value,
      };

      // For now, just print the data to the console
      print(subscriptionData);

      // Here, you can call your backend service to create the subscription
      // e.g., BackendService.createSubscription(subscriptionData);
    } else {
      Get.snackbar('Error', 'Please select a plan.');
    }
  }
}
