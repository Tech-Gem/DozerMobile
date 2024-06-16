import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/presentation/subscription/repositories/subscription_repository.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

enum Status { loading, success, error }

class SubscriptionController extends GetxController {
  RxString selectedPlan = ''.obs;
  RxInt selectedDuration = 30.obs; // Default duration is 30 days
  Rx<Status> status = Status.loading.obs;
  final SubscriptionRepository _subscriptionRepository =
      SubscriptionRepository();

  void selectPlan(String plan) {
    selectedPlan(plan);
  }

  void selectDuration(int duration) {
    selectedDuration(duration);
  }

  Future<void> confirmSubscription() async {
    if (selectedPlan.isNotEmpty) {
      status(Status.loading);

      print(
        selectedPlan.value,
      );
      print(
        selectedDuration.value,
      );
      try {
        final response = await _subscriptionRepository.createSubscription(
          selectedPlan.value,
          selectedDuration.value,
        );

        status(Status.success);

        // Assuming response is a map containing "msg" and "paymentUrl"
        // final msg = response['msg'];
        final paymentUrl = response['paymentUrl'];

        // Get.snackbar('Subscription', msg);

        Get.defaultDialog(
          buttonColor: AppColors.primaryColor,
          contentPadding: const EdgeInsets.all(20),
          title: 'Subscription Confirmation',
          middleText:
              'You have selected the ${selectedPlan.value} plan for ${selectedDuration.value} days.',
          textConfirm: 'OK',
          onConfirm: () {
            Get.back(); // Close the dialog
            _launchPaymentUrl(paymentUrl);
          },
          textCancel: 'Cancel',
          onCancel: () {
            Get.back(); // Close the dialog
          },
        );
      } catch (e) {
        status(Status.error);
        Get.snackbar(
            'Error', 'Failed to create subscription. Please try again.');
      }
    } else {
      Get.snackbar('Error', 'Please select a plan.');
    }
  }

  void _launchPaymentUrl(String url) async {
    final Uri _url = Uri.parse(url);
    print('Launching payment URL: $url');
    if (!await launchUrl(_url)) {
      Get.snackbar('Error', 'Could not launch payment URL.');
    } else {

      // Listen for when the user returns to the app
      _checkSubscriptionAfterReturn();
    }
  }

  void _checkSubscriptionAfterReturn() async {
    // Delay to allow the user to return from payment
    await Future.delayed(Duration(seconds: 5));
    try {
      final isSubscribed =
          await _subscriptionRepository.checkSubscriptionStatus();
      if (isSubscribed) {
        Get.snackbar('Subscription', 'Successfully subscribed.');
        Get.offAllNamed(RoutesName.home); // Navigate to the home screen
      } else {
        Get.snackbar('Error', 'Subscription was not successful.');
        Get.offAllNamed(RoutesName.home); // Navigate to the home screen
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to check subscription status.');
      Get.offAllNamed(RoutesName.home); // Navigate to the home screen
    }
  }
}
