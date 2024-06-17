import 'package:dozer_mobile/core/data/apis/api_end_points.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationRepository {
  final String url = ApiEndPoints.baseUrl + ApiEndPoints.confirmBooking;
  // final String token = GetStorageHelper.getValue("token");
 final NetworkApiService _apiService = NetworkApiService();


  Future<bool> confirmOrRejectBooking(String bookingId, String status) async {
    final Map<String, dynamic> requestBody = {
      'bookingId': bookingId,
      'status': status,
    };

    final response = await _apiService.postResponse(url, requestBody);
    return response['status'] == 'success';


  }
}
