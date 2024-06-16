import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/controllers/bid_controller.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/home/HomeRoomItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dozer_mobile/core/utils/colors.dart';

import 'package:get/get.dart'; // Update the package path

class Home extends StatelessWidget {
  final BidController _bidController = Get.put(BidController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Load bids when the page is built
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _bidController.loadBids();
    });

    return Scaffold(
      extendBody: true,
      body: Obx(
        () => _bidController.status.value == Status.loading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 200),
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemCount: _bidController.bidsList.length + 1, // +1 for the header
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Header
                    return Text(
                      "Happening now",
                      style: theme.textTheme.titleLarge,
                    );
                  } else {
                    // Bid item
                    final bid = _bidController.bidsList[index - 1];
                    return HomeRoomItem(
                      roomId: bid.roomId,
                      title: bid.title,
                      description: bid.description,
                      hostName: bid.userName, // Assuming userName is the host name
                    );
                  }
                },
              ),
      ),
    );
  }
}
