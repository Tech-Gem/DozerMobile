import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/notification/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.find();

    final arguments = Get.arguments;
    if (arguments != null) {
      controller.setArguments(arguments);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: AppColors.primaryColor,
                        size: 50.sp,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        controller.message.value,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (controller.notificationType.value ==
                          'booking requested') ...[
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () =>
                                  controller.handleBookingAction('Confirmed'),
                              child: Text('Confirm'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                textStyle: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  controller.handleBookingAction('Rejected'),
                              child: Text('Reject'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                textStyle: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: () {
                            Get.offNamed('/home');
                          },
                          child: Text('Okay'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            textStyle: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ],
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
