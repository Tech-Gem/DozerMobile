import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/notification/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());

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
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(25.w),
                child: Obx(() {
                  if (controller.status.value == Status.loading) {
                    return CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                    );
                  } else if (controller.status.value == Status.error) {
                    return Text(
                      controller.status.value.toString(),
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    );
                  } else {
                    return _buildNotificationContent(context, controller);
                  }
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationContent(
      BuildContext context, NotificationController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.notifications_active,
          color: AppColors.primaryColor,
          size: 60.sp,
        ),
        SizedBox(height: 20.h),
        Text(
          'Notification',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 15.h),
        Text(
          controller.message.value,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        if (controller.notificationType.value == 'BookingRequest') ...[
          SizedBox(height: 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => controller.handleBookingAction('Confirmed'),
                label: Text('Confirm', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                  textStyle: TextStyle(fontSize: 16.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => controller.handleBookingAction('Rejected'),
                label: Text('Reject', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                  textStyle: TextStyle(fontSize: 16.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ],
          ),
        ] else if (controller.notificationType.value == 'BookingStatus') ...[
          SizedBox(height: 25.h),
          ElevatedButton(
            onPressed: () {
              Get.offNamed('/home');
            },
            child: Text('Okay', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
              textStyle: TextStyle(fontSize: 16.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ] else ...[
          SizedBox(height: 25.h),
          ElevatedButton(
            onPressed: () {
              Get.offNamed('/home');
            },
            child: Text('Okay'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
              textStyle: TextStyle(fontSize: 16.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
