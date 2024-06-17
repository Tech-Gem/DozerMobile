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
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.all(16.w), // Using ScreenUtil for responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button with circle shadow
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(height: 16.h),
              // Title centered
              Center(
                child: Text(
                  'Select a Subscription Plan',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
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
                      description:
                          'Access to unlimited equipment posts and up to 10 bidding posts per month.',
                      isSelected: controller.selectedPlan.value == 'Basic',
                      onTap: () => controller.selectPlan('Basic'),
                    ),
                    SubscriptionOption(
                      title: 'Standard',
                      price: 1000,
                      description:
                          'Access to unlimited equipment posts and up to 50 bidding posts per month.',
                      isSelected: controller.selectedPlan.value == 'Standard',
                      onTap: () => controller.selectPlan('Standard'),
                    ),
                    SubscriptionOption(
                      title: 'Premium',
                      price: 1500,
                      description:
                          'Access to unlimited equipment posts and unlimited bidding posts.',
                      isSelected: controller.selectedPlan.value == 'Premium',
                      onTap: () => controller.selectPlan('Premium'),
                    ),
                  ],
                );
              }),
              SizedBox(height: 20.h),
              // Confirm Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle subscription confirmation
                    controller.confirmSubscription();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 36.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 16.sp, color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionOption extends StatelessWidget {
  final String title;
  final int price;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionOption({
    required this.title,
    required this.price,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : Colors.grey.withOpacity(0.3),
            width: 2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              '\$$price/month',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
