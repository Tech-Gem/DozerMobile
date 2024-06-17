import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/core/utils/dynamic_colors.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/liveroom/LiveRoom.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/screen_widgets.dart/squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRoomItem extends StatelessWidget {
  final String title;
  final String description;
  final int participantsCount;
  final String hostName;

  const HomeRoomItem({
    Key? key,
    required this.title,
    required this.description,
    required this.participantsCount,
    required this.hostName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => LiveRoom(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(
              0xFF6200EA), // Background color similar to the provided image
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
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
                SizedBox(width: 8),
                Text(
                  'LIVE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
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
                Squircle(),
                SizedBox(width: 5),
                Squircle(),
                SizedBox(width: 5),
                Squircle(),
                SizedBox(width: 8),
                Text(
                  '$participantsCount listening',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              hostName,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_fill,
                        size: 18,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 3),
                      Text(
                        '$participantsCount',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: Colors.white70,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
