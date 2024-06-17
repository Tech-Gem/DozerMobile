import 'package:dozer_mobile/core/data/apis/api_end_points.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';
import 'package:dozer_mobile/core/utils/logger.dart';

class SubscriptionRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future<Map<String, dynamic>> createSubscription(
      String subscriptionType, int subscriptionDuration) async {
    const String url = ApiEndPoints.baseUrl + ApiEndPoints.subscription;

    final Map<String, dynamic> requestBody = {
      'subscriptionType': subscriptionType,
      'subscriptionDuration': subscriptionDuration,
    };

    try {
      Logger.log('Creating subscription: $requestBody');
      final response = await _apiService.postResponse(url, requestBody);
      Logger.log('Subscription created successfully: $response');
      return response;
    } catch (e) {
      Logger.log('Error creating subscription: $e');
      throw e;
    }
  }
Future<bool> fetchSubscriptionStatus() async {
    final response = await _apiService.getResponse( ApiEndPoints.baseUrl + '/subscription/isSubscribed');
    return response['isSubscribed'] as bool;
  }
  Future<bool> checkSubscriptionStatus() async {
    // Replace with your actual API endpoint to check subscription status
    const String url = ApiEndPoints.baseUrl + ApiEndPoints.subscriptionStatus;

    try {
      final response = await _apiService.getResponse(url);
      // Assuming the response contains 'isSubscribed' field as a boolean
      return response['isSubscribed'] ?? false;
    } catch (e) {
      print('Error checking subscription status: $e');
      throw e;
    }
  }
}
