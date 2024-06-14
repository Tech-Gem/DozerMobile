// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/constant_zego.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart'; // Changed to video streaming package

class LivePage extends StatelessWidget {
  final String roomID;
  final bool isHost;
  final String userName;
  final String userId;
  final String title; // Added title field
  final String description; // Added description field

  const LivePage({
    Key? key,
    required this.roomID,
    required this.isHost,
    required this.userName,
    required this.userId,
    required this.title, // Required title in the constructor
    required this.description, // Required description in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: ConstantZegoCloud.appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: ConstantZegoCloud.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userId,
        userName: userName,
        liveID: roomID, // Changed to liveID for video streaming
        config: (isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience())));
      
         
    
  }

  Widget avatarBuilder(
    BuildContext context,
    Size size,
    ZegoUIKitUser? user,
    Map<String, dynamic> extraInfo,
  ) {
    return CircleAvatar(
      maxRadius: size.width,
      // backgroundImage: Image.asset(
      //         "assets/avatars/avatar_${((int.tryParse(user?.id ?? "") ?? 0) % 6).toString()}.png")
      //     .image,
    );
  }

  Widget background() {
    /// how to replace background view
    return Stack(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       fit: BoxFit.fill,
        //       image: Image.asset('assets/images/bg.jpeg').image,
        //     ),
        //   ),
        // ),
        Positioned(
          top: 10,
          left: 10,
          child: Text(
            title, // Displaying the title
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff1B1B1B),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Positioned(
          top: 10 + 20,
          left: 10,
          child: Text(
            description, // Displaying the description instead of room ID
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff606060),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
