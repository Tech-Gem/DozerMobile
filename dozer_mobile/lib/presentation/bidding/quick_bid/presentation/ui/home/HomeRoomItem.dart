import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/live_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRoomItem extends StatelessWidget {
  final String title;
  final String description;
  final String hostName;
  final String roomId; // New roomId parameter

  const HomeRoomItem({
    Key? key,
    required this.title,
    required this.description,
    required this.hostName,
    required this.roomId, // New roomId parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        _showDescriptionPopup(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.fromLTRB(30, 24, 30, 24),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    hostName.substring(0, 1),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  hostName,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFeff0f5),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_fill,
                        size: 18,
                      ),
                      SizedBox(width: 3),
                      Text("354"),
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.mic_fill,
                        size: 18,
                      ),
                      SizedBox(width: 3),
                      Text("354"),
                    ],
                  ),
                ),
              ],
            )
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
          content: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white, // White background color
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
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
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
                foregroundColor: Colors.amber, // Yellow button color
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
