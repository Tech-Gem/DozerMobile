import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationRepository {
  final String baseUrl;

  NotificationRepository({required this.baseUrl});

  Future<bool> confirmOrRejectBooking(String bookingId, String status) async {
    final url = Uri.parse('$baseUrl/bookings/confirm-or-reject');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'bookingId': bookingId,
        'status': status,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
