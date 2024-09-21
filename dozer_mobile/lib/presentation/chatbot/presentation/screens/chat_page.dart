import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            height: 1.0,
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
              ),
              child: Image.asset('assets/images/chat_bot.png'),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Text('Chatbot', style: TextStyle(fontSize: 20)),
                Text('Support Agent', style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/chat_bot_main_page.png',
                width: 232.w,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(38.h),
              child: Text(
                "Hey, I'm your assistant. Tell me what you're looking for today, and I'll help you find the perfect match!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        elevation: 0,
        height: 75.h,
        padding: EdgeInsets.all(0.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write a message',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.attach_file,
                  color: Colors.orange,
                  size: 30.w,
                ),
                onPressed: () {
                  _showAttachmentOptions(context);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.orange,
                  size: 30.w,
                ),
                onPressed: () {
                  // Sending message functionality goes here.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 1,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: [
                  Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.w)),
                    ),
                    child: Container(
                      height: 60.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: TextButton(
                        onPressed: () {
                          // Pick image from gallery
                        },
                        child: Text(
                          'Photo Gallery',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 0.01,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10.w)),
                    ),
                    child: Container(
                      height: 60.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextButton(
                        onPressed: () {
                          // Take photo with camera
                        },
                        child: Text(
                          'Camera',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.w),
              Card(
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Container(
                  width: double.infinity,
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
