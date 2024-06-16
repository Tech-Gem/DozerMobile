// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/constant_zego.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

class LivePage extends StatelessWidget {
  final String roomID;
  final bool isHost;
  final String userName;
  final String userId;
  final String ? title;
  final String ? description;

  const LivePage({
    Key? key,
    required this.roomID,
    required this.isHost,
    required this.userName,
    required this.userId,
     this.title,
     this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
          appID: ConstantZegoCloud.appId,
          appSign: ConstantZegoCloud.appSign,
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
    return CircleAvatar(maxRadius: size.width);
  }

  Widget background() {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: Text(
            title!,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff1B1B1B),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: Text(
            description!,
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
