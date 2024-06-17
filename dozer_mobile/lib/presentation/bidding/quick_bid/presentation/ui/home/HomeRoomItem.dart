import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/live_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/liveroom/LiveRoom.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/screen_widgets.dart/squircle.dart';

class HomeRoomItem extends StatelessWidget {
  final String title;
  final String description;
  final int participantsCount;
  final String hostName;
  final String priceMin;
  final String priceMax;
  final String roomId; // New roomId parameter
  final List<String> participantImages; // List of participant profile images

  const HomeRoomItem({
    Key? key,
    required this.title,
    required this.description,
    required this.participantsCount,
    required this.hostName,
    required this.priceMin,
    required this.priceMax,
    required this.roomId, // New roomId parameter
    required this.participantImages, // List of participant profile images
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        _showDescriptionPopup(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFE8900D)
              .withOpacity(0.8), // Lighter shade of primary color
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.live_tv,
                    color: Color(0xFF6200EA),
                    size: 20,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'LIVE',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                for (var image
                    in participantImages.take(3)) // Display up to 3 images
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(image), // Assuming images are URLs
                      radius: 12,
                    ),
                  ),
                SizedBox(width: 10),
                Text(
                  '$participantsCount listening',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              hostName,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$priceMin - \$$priceMax',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: Colors.black54,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDescriptionPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Join Bid',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 10),
                Text(
                  'Host: $hostName',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 10),
                Text(
                  'Price: \$$priceMin - \$$priceMax',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 10),
                Text(
                  'Do you want to join this bidding?',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle join bid action
                 Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return LivePage(
              roomID: roomId,  
              isHost: false,
              userName: 'Joiner', // Adjust based on your implementation
              userId: '123',
           title: title, description: description,
            );
          }),
        );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.amber, // Yellow button color
              ),
              child: Text('Join Bid'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
