import 'package:dozer_mobile/core/data/apis/api_end_points.dart';
import 'package:dozer_mobile/core/data/network/api_exceptions.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';

import 'dart:convert';

import 'package:dozer_mobile/presentation/user_notification/model/notification_model.dart';

class NotificationRepository {
  final String apiUrl = ApiEndPoints.baseUrl + '/notification';
  final NetworkApiService _apiService = NetworkApiService();

  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final response = await _apiService.getResponse(apiUrl);
      print('Response of notifications API: $response');

      if (response != null && response['status'] == 'success') {
        final List<dynamic> notificationsData = response['notifications'];
        print('Notifications data: $notificationsData');

        final List<NotificationModel> notifications = notificationsData
            .map((notificationJson) =>
                NotificationModel.fromJson(notificationJson))
            .toList();
        print('Notifications: $notifications');

        return notifications;
      } else {
        throw ApiException(
            'Invalid response format. Expected a valid response with status "success".');
      }
    } catch (error) {
      throw ApiException('Error during API request: $error');
    }
  }

  Future<bool> confirmOrRejectBooking(String bookingId, String status) async {
    final Map<String, dynamic> requestBody = {
      'bookingId': bookingId,
      'status': status,
    };

    final response = await _apiService.postResponse(apiUrl, requestBody);
    return response['status'] == 'success';


  }
}
