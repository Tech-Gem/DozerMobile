
import 'package:dozer_mobile/core/utils/dynamic_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveRoomMember extends StatelessWidget {
  final bool isMuted;
  final bool isNewMember;
  final bool isModerator;
  final String name;
  final String imagePath;
  final Color? color;
  const LiveRoomMember({
    Key? key,
    required this.name,
    required this.imagePath,
    this.color,
    this.isMuted = true,
    this.isNewMember = false,
    this.isModerator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CircleAvatar(
                    backgroundColor: color ?? Colors.grey.shade100,
                    backgroundImage: NetworkImage(imagePath),
                  ),
                ),
                if (isNewMember)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: CircleAvatar(
                      radius: 13,
                      child: Text("🎉"),
                      backgroundColor: DynamicColor.withBrightness(
                        context: context,
                        color: Colors.white,
                        darkColor: Colors.black12,
                      ),
                    ),
                  ),
                if (isMuted)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: DynamicColor.withBrightness(
                        context: context,
                        color: Colors.white,
                        darkColor: Colors.black12,
                      ),
                      child: Icon(
                        CupertinoIcons.mic_slash,
                        size: 16,
                        color: DynamicColor.withBrightness(
                          context: context,
                          color: Colors.grey.shade800,
                          darkColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isModerator)
              Stack(
                children: [
                  Icon(
                    CupertinoIcons.asterisk_circle,
                    color: Colors.white,
                    size: 20,
                  ),
                  Icon(
                    CupertinoIcons.asterisk_circle_fill,
                    color: Color(0xFF3d76f9),
                    size: 20,
                  ),
                ],
              ),
            SizedBox(width: 3),
            Text(
              "$name",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
