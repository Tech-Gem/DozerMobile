import 'package:dozer_mobile/presentation/chatbot/presentation/bloc/chat_bot_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCard extends StatelessWidget {
  final String text;
  final bool isUser;
  final bool isNotWorking;
  final String retryMessage;
  const ChatCard({
    super.key,
    required this.text,
    this.isUser = false,
    this.isNotWorking = false,
    this.retryMessage = '',
  });

  @override
  Widget build(BuildContext context) {
    // context.read<UserProfileBloc>().add(GetUserEvent());
    // final info = (context.read<UserProfileBloc>().state as UserDataLoadedState)
    //     .userDataModel;
    return Container(
      padding: EdgeInsets.all(18.h),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment:
                isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              !isUser
                  ? Image.asset(
                      'assets/images/chat_bot.png',
                      width: 20.w,
                    )
                  : Container(),
              SizedBox(width: 10.h),
              Text(
                !isUser
                    ? 'Live chat ${DateTime.now().hour}:${DateTime.now().minute}'
                    : 'Visitor ${DateTime.now().hour}:${DateTime.now().minute}',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            constraints: BoxConstraints(
              maxWidth: 250.w,
            ),
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: isUser ? Colors.orange : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isUser ? Colors.orange : Colors.grey,
                width: 0.4.w,
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isUser ? Colors.white : Colors.black,
              ),
            ),
          ),

          isNotWorking && retryMessage.isNotEmpty
              ? TextButton(
                  onPressed: () {
                    // Retry logic here
                    // For example, you might want to dispatch an event to retry the last operation
                    context
                        .read<ChatBotBloc>()
                        .add(ChatBotSendMessage(message: retryMessage));
                  },
                  child: Text('Retry'),
                )
              : Container(),
          SizedBox(height: 10.h),
          // !isUser
          //     ? Container()
          //     : Container(
          //         width: 40, // Adjust the size here
          //         height: 40, // Adjust the size here
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border: Border.all(
          //             // Add a border
          //             color: Colors.grey.withOpacity(0.5),
          //             width: 1.0,
          //           ),
          //           image: DecorationImage(
          //             image: NetworkImage(info.profilePicture),
          //             fit: BoxFit.scaleDown,
          //           ),
          //         ),
          //       ),
        ],
      ),
    );
  }
}
