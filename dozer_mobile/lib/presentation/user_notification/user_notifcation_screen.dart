import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/presentation/notification/controllers/notification_controller.dart';
import 'package:dozer_mobile/presentation/user_notification/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotificationsPage extends StatelessWidget {
  final NotificationController _notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',style: TextStyle(color: Colors.white),),
        backgroundColor: primaryColor,
      ),
      body: _buildNotificationList(),
    );
  }

  Widget _buildNotificationList() {
    return Obx(() {
      if (_notificationController.status.value == Status.loading) {
        return Center(child: CircularProgressIndicator());
      } else if (_notificationController.status.value == Status.error) {
        return Center(child: Text('No notifications'));
      } else {
        return ListView.builder(
          itemCount: _notificationController.notifications.length,
          itemBuilder: (context, index) {
            final notification =
                _notificationController.notifications[index];
            return ListTile(
              title: Text(notification.message),
              subtitle: Text(notification.type),
              onTap: () =>
                  _handleNotificationTap(context, notification),
            );
          },
        );
      }
    });
  }

  void _handleNotificationTap(
      BuildContext context, NotificationModel notification) {
    // Handle different types of notifications
    if (notification.type == 'Booking Request') {
      _showBookingRequestDialog(context);
    } else if (notification.type == 'Booking Confirmation') {
      _showBookingConfirmedPopup(context);
    }
  }

  void _showBookingRequestDialog(BuildContext context) {
    // Implementation of booking request dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Request'),
          content: Text('Confirm or Reject this booking?'),
          actions: [
            TextButton(
              onPressed: () {
                // TODO: Handle Confirm action
                Navigator.pop(context);
              },
              child: Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Handle Reject action
                Navigator.pop(context);
              },
              child: Text('Reject'),
            ),
          ],
        );
      },
    );
  }

  void _showBookingConfirmedPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmed'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your booking has been confirmed.'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to rental agreement page
                  Get.toNamed(RoutesName.agreementForm);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text('Generate Rental Document', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
