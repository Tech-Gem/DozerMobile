import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/subscription/controllers/subscription_controller.dart';
import 'package:dozer_mobile/presentation/subscription/widgets/subscription_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPage extends StatelessWidget {
  final SubscriptionController controller = Get.put(SubscriptionController());

  SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Plan'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding:
            EdgeInsets.all(16.w), // Using ScreenUtil for responsive padding
        child: Column(
          children: [
            // Title
            Text(
              'Select a Subscription Plan',
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20.h),
            // Subscription Options
            Obx(() {
              return Column(
                children: [
                  SubscriptionOption(
                    title: 'Basic',
                    price: 500,
                    isSelected: controller.selectedPlan.value == 'Basic',
                    onTap: () => controller.selectPlan('Basic'),
                  ),
                  SubscriptionOption(
                    title: 'Standard',
                    price: 1000,
                    isSelected: controller.selectedPlan.value == 'Standard',
                    onTap: () => controller.selectPlan('Standard'),
                  ),
                  SubscriptionOption(
                    title: 'Premium',
                    price: 3000,
                    isSelected: controller.selectedPlan.value == 'Premium',
                    onTap: () => controller.selectPlan('Premium'),
                  ),
                ],
              );
            }),
            SizedBox(height: 20.h),
            // Duration Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Duration: ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                Obx(() {
                  return DropdownButton<int>(
                    value: controller.selectedDuration.value,
                    items: [30, 60, 90].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value days'),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      if (newValue != null) {
                        controller.selectDuration(newValue);
                      }
                    },
                  );
                }),
              ],
            ),
            SizedBox(height: 20.h),
            // Confirm Button
            ElevatedButton(
              onPressed: () {
                // Handle subscription confirmation
                controller.confirmSubscription();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 36.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
