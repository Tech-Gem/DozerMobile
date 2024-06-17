import 'dart:convert';
import 'package:dozer_mobile/core/data/network/api_exceptions.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/presentation/booking/models/booking_form_model.dart';
import 'package:http/http.dart' as http;

class BookingRepository {
  final String apiUrl = 'https://dozer-backend-tech-gem.onrender.com/api/v1/';
  final NetworkApiService _apiService = NetworkApiService();

  Future<bool> confirmBooking(BookingModel booking) async {
   String bearerToken = GetStorageHelper.getValue('token');
   print('+++++++++++++++++++++++++Bearer token: $bearerToken');
    try {
      final http.Response response = await http.post(
        Uri.parse('${apiUrl}bookings'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $bearerToken',
        },
        body: jsonEncode(booking.toJson()),
      );

      final responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200 && responseBody['status'] == 'success') {
        return true;
      } else {
        throw ApiException(
            'Failed to confirm booking. Status: ${responseBody['status']}');
      }
    } catch (error) {
      throw ApiException('Error during API request: $error');
    }
  }
  
   Future<List<BookingModel>> getBookings() async {
    try {
      final response = await _apiService.getResponse('${apiUrl}bookings');
      if (response != null && response['status'] == 'success') {
        final List<dynamic> machinesData = response['bookings'];

        final List<BookingModel> recommendedMachines = machinesData
            .map((machineJson) =>
                BookingModel.fromJson(machineJson as Map<String, dynamic>))
            .toList();

        return recommendedMachines;
      } else {
        throw ApiException('Invalid response format. Expected a valid response with status "success".');
      }
    } catch (error) {
      throw ApiException('Error during API request: $error');
    }
  }
}
