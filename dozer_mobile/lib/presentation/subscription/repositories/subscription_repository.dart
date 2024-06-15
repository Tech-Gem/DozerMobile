import 'dart:async';
import 'package:dozer_mobile/core/data/apis/api_end_points.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';
import 'package:dozer_mobile/core/utils/logger.dart';

class SubscriptionRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future<void> createSubscription(String subscriptionType, int subscriptionDuration) async {
    const String url = ApiEndPoints.baseUrl + ApiEndPoints.subscription;
    
    final Map<String, dynamic> requestBody = {
      'subscriptionType': subscriptionType,
      'subscriptionDuration': subscriptionDuration,
    };

    try {
      Logger.log('Creating subscription: $requestBody');
      final response = await _apiService.postResponse(url, requestBody);
      Logger.log('Subscription created successfully: $response');
    } catch (e) {
      Logger.log('Error creating subscription: $e');
      throw e;
    }
  }
}
