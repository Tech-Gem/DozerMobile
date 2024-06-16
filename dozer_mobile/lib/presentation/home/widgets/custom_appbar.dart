import 'package:dozer_mobile/core/language/language_controller.dart';
import 'package:dozer_mobile/presentation/announcement_screen/announcement_screen.dart';
import 'package:dozer_mobile/presentation/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Open the drawer
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Handle language change icon press
                  // Here, you can navigate to a language selection page or toggle between languages
                  // For demonstration, let's call a method from the language controller to change language
                  Get.put(LanguageController()).toggleLanguage();
                },
                icon: SvgPicture.asset(
                  'assets/icons/language.svg',
                ),
              ),
              Text(
                'Language',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              // Handle notification icon press
              // Navigate to the announcement page
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProfileScreen();
                  },
                ),
              );
            },
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              width: 30.w,
              height: 30.h,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
