import 'dart:convert';
import 'package:dozer_mobile/core/data/network/api_exceptions.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/models/bidding_model.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/models/bidding_response.dart';
import 'package:http/http.dart' as http;

class BidRepository {
  final String apiUrl = 'https://dozer-backend-tech-gem.onrender.com/api/v1/';
  final String bearerToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjkwZTI2ZWNhLTQ4ZDktNDc5Ny1iNjEzLWVkNDBmNzM5NzFmMSIsImlhdCI6MTcxODUzNjE5OCwiZXhwIjoxNzI2MzEyMTk4fQ.YeCciz33URIJmTb4mKLh3YihZN-u5WBWhUXmXZMb1hI";

  Future<BidResponse> createBid(BidModel bid) async {
    try {
      final Map<String, dynamic> bidJson = bid.toJson();

      final http.Response response = await http.post(
        Uri.parse('${apiUrl}bidSpace'),
        body: jsonEncode(bidJson),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $bearerToken',
        },
      );
      print('***********************');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 201 && responseBody['status'] == 'success') {
        print("got here ");
        final bidResponse = BidResponse.fromJson(responseBody['newBid']);
        return bidResponse;
      } else {
        throw ApiException(
          'Failed to create bid. Status: ${responseBody['status']}, Message: ${responseBody['message'] ?? 'No message provided'}',
        );
      }
    } catch (error) {
      print('Exception during API request: $error');
      throw ApiException('Error during API request: $error');
    }
  }

  Future<List<BidResponse>> getBids() async {
    try {
      final http.Response response = await http.get(
        Uri.parse('${apiUrl}bidSpace'),
        headers: {
          'Authorization': 'Bearer $bearerToken',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> bidsData = jsonDecode(response.body)['bidSpaces'];

        final List<BidResponse> bids =
            bidsData.map((bidJson) => BidResponse.fromJson(bidJson)).toList();

        return bids;
      } else {
        throw ApiException(
            'Invalid response format. Expected a valid response with status "success".');
      }
    } catch (error) {
      throw ApiException('Error during API request: $error');
    }
  }
}
