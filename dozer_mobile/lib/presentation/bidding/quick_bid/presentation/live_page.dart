// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/constant_zego.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';


class LivePage extends StatelessWidget {
  final String roomID;
  final bool isHost;
  final String userName;
  final String userId;

  const LivePage({
    Key? key,
    required this.roomID,
    required this.isHost,
    required this.userName,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
          appID: ConstantZegoCloud
              .appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
          appSign: ConstantZegoCloud
              .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
          userID: userId,
          userName: userName,
          roomID: roomID,
          config: (isHost
              ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
              : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience())
            ..background = background()
            ..userAvatarUrl = 'https://robohash.org/$userId.png'),
    );
  }

  Widget avatarBuilder(
    BuildContext context,
    Size size,
    ZegoUIKitUser? user,
    Map<String, dynamic> extraInfo,
  ) {
    return CircleAvatar(
      maxRadius: size.width);
     
  }

  Widget background() {
    /// how to replace background view
    return Stack(
      children: [

        const Positioned(
            top: 10,
            left: 10,
            child: Text(
              'Live Audio Room',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xff1B1B1B),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            )),
        Positioned(
          top: 10 + 20,
          left: 10,
          child: Text(
            'ID: $roomID',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff606060),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}