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
  const HomeRoomItem({
    Key? key,
    required this.title,
    required this.description,
    required this.participantsCount, required String hostName,
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
                color: primaryColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: DynamicColor.withBrightness(
                  context: context,
                  color: primaryColor,
                  darkColor: Colors.grey.shade300,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Squircle(),
                SizedBox(width: 5),
                Squircle(),
                SizedBox(width: 5),
                Squircle(),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: DynamicColor.withBrightness(
                      context: context,
                      color: Color(0xFFeff0f5),
                      darkColor: Color(0xFF404182),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_fill,
                        size: 18,
                      ),
                      SizedBox(width: 3),
                      Text("$participantsCount"),
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.mic_fill,
                        size: 18,
                      ),
                      SizedBox(width: 3),
                      Text("$participantsCount"),
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
}
