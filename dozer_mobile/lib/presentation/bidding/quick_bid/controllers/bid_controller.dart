import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/models/bidding_model.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/models/bidding_response.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/repository/bidding_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BidController extends GetxController {
  final NetworkApiService _apiService = NetworkApiService();
  final BidRepository _bidRepository = BidRepository();
  final titleController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  final priceMinController = TextEditingController().obs;
  final priceMaxController = TextEditingController().obs;

  RxList<BidResponse> bidsList = <BidResponse>[].obs;
  Rx<Status> status = Status.loading.obs;

  Future<BidResponse> createBid(String title, String description, int priceMin, int priceMax) async {
    try {
      final BidModel bid = BidModel(
        title: title,
        description: description,
        priceMin: priceMin,
        priceMax: priceMax,
      );
      final BidResponse bidResponse = await _bidRepository.createBid(bid);
      return bidResponse;
    } catch (error) {
      throw Exception('Error creating bid: $error');
    }
  }

  Future<void> loadBids() async {
    try {
      status(Status.loading);
      final List<BidResponse> bids = await _bidRepository.getBids();
      if (bids.isNotEmpty) {
        bidsList.assignAll(bids);
        status(Status.completed);
      } else {
        status(Status.error);
        print('Error loading bids: Empty response');
      }
    } catch (error) {
      status(Status.error);
      print('Error loading bids: $error');
    }
  }

  void searchBids(String searchText) {
    if (searchText.isEmpty) {
      loadBids(); // Reload all bids if search text is empty
    } else {
      bidsList.assignAll(bidsList.where((bid) =>
          bid.title.toLowerCase().contains(searchText.toLowerCase())));
    }
  }
}
