
import 'package:dozer_mobile/core/utils/dynamic_colors.dart';
import 'package:dozer_mobile/core/utils/memji_colors.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/ui/liveroom/LiveRoomMember.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveRoom extends StatelessWidget {
  const LiveRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final members = [
  LiveRoomMember(
    name: "Sarah",
    isModerator: true,
    isMuted: false,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.black,
  ),
  LiveRoomMember(
    name: "Daniel",
    isModerator: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.amber,
  ),
  LiveRoomMember(
    name: "Samantha",
    isModerator: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.white,
  ),
  LiveRoomMember(
    name: "Aishat",
    isModerator: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.yellow,
  ),
  LiveRoomMember(
    name: "Ruth",
    isModerator: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.green,
  ),
  LiveRoomMember(
    name: "Rich",
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.red,
  ),
  LiveRoomMember(
    name: "Sarah",
    isNewMember: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.blue,
  ),
  LiveRoomMember(
    name: "Mercy",
    isNewMember: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.white,
  ),
  LiveRoomMember(
    name: "Tim",
    isNewMember: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.purple,
  ),
  LiveRoomMember(
    name: "Ed",
    isNewMember: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.yellow,
  ),
  LiveRoomMember(
    name: "John",
    isNewMember: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.green,
  ),
  LiveRoomMember(
    name: "Lauret",
    isNewMember: true,
    imagePath: "https://images.squarespace-cdn.com/content/v1/5921a34815d5dbdde23659de/1570301652232-9VSFS0PK5D27F6FPIW1X/47256809_2272782842945619_683046380633390517.jpg?format=2500w",
    color: MemojiColors.purple,
  ),
];

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Design talk and chill"),
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: IconButton(
              icon: Icon(CupertinoIcons.chevron_down),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: members.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 14,
                ),
                itemBuilder: (context, index) {
                  return members[index];
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 6,
                    width: 70,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          maxLines: null,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF8281ea),
                            hintText: "Type a thought here...",
                            hintStyle: TextStyle(color: Colors.white70),
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        foregroundColor: theme.primaryColor,
                        child: Icon(CupertinoIcons.paperplane_fill),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ColoredBox(
          color: theme.primaryColor,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            height: 110,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  TextButton.icon(
                    icon: Text(
                      "✌🏼",
                      style: TextStyle(fontSize: 18),
                    ),
                    label: Text("Leave quietly"),
                    style: TextButton.styleFrom(
                      foregroundColor: DynamicColor.withBrightness(
                        context: context,
                        color: theme.primaryColor,
                        darkColor: Color(0xFF9d97ec),
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      backgroundColor: DynamicColor.withBrightness(
                        context: context,
                        color: Color(0xFFeff0f5),
                        darkColor: Color(0xFF2a2b29),
                      ),
                    ),
                    onPressed: () {},
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: DynamicColor.withBrightness(
                      context: context,
                      color: Color(0xFFeff0f5),
                      darkColor: Color(0xFF2a2b29),
                    ),
                    child: Text(
                      "✋🏼",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 24,
                    child: Image.asset("assets/images/10.png"),
                    backgroundColor: DynamicColor.withBrightness(
                      context: context,
                      color: Color(0xFFeff0f5),
                      darkColor: Color(0xFF2a2b29),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
