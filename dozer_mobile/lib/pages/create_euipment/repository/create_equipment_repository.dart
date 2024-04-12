import 'dart:convert';
import 'package:dozer_mobile/data/apis/api_end_points.dart';
import 'package:dozer_mobile/pages/create_euipment/models/equipment_model.dart';
import 'package:http/http.dart' as http;

class EquipmentRepository {
  final String baseUrl = ApiEndPoints.baseUrl;
  final String userToken; // Assuming you have a mechanism to get the user token

  EquipmentRepository(this.userToken);

  Future<bool> createEquipment(Equipment equipment) async {
    final url = Uri.parse('$baseUrl${ApiEndPoints.createEquipment}');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken', // Include user token in headers
        },
        body: jsonEncode(equipment.toJson()),
      );

      if (response.statusCode == 200) {
        // Equipment created successfully
        return true;
      } else {
        // Handle errors based on response status code or response body
        print('Error creating equipment: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle network errors
      print('Network error creating equipment: $error');
      return false;
    }
  }
}