// import 'package:dozer_mobile/core/language/language_controller.dart';
// import 'package:dozer_mobile/presentation/announcement_screen/announcement_screen.dart';
// import 'package:dozer_mobile/presentation/profile_screen/profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // IconButton(
//           //   onPressed: () {
//           //     // Open the drawer
//           //     Scaffold.of(context).openDrawer();
//           //   },
//           //   icon: SvgPicture.asset(
//           //     'assets/icons/menu.svg',
//           //   ),
//           // ),
//           Scaffold(
//   appBar: AppBar(
//     title: Text('Your App Title'),
//     leading: IconButton(
//       icon: SvgPicture.asset('assets/icons/menu.svg'),
//       onPressed: () {
//         Scaffold.of(context).openDrawer();
//       },
//     ),
//   ),
//   drawer: Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: <Widget>[
//         DrawerHeader(
//           child: Text('Drawer Header'),
//           decoration: BoxDecoration(
//             color: Colors.blue,
//           ),
//         ),
//         ListTile(
//           title: Text('Item 1'),
//           onTap: () {
//             // Update the state of the app
//             // Then close the drawer
//             Navigator.pop(context);
//           },
//         ),
//         ListTile(
//           title: Text('Item 2'),
//           onTap: () {
//             // Update the state of the app
//             // Then close the drawer
//             Navigator.pop(context);
//           },
//         ),
//       ],
//     ),
//   ),
//   body: Center(
//     child: Text('Your Main Content'),
//   ),
// ),
// //           Scaffold(
// //   appBar: AppBar(
// //     title: const Text('AppBar without hamburger button'),
// //   ),
// //   drawer: Drawer(
// //   // Add a ListView to the drawer. This ensures the user can scroll
// //   // through the options in the drawer if there isn't enough vertical
// //   // space to fit everything.
// //   child: ListView(
// //     // Important: Remove any padding from the ListView.
// //     padding: EdgeInsets.zero,
// //     children: [
// //       const DrawerHeader(
// //         decoration: BoxDecoration(
// //           color: Colors.blue,
// //         ),
// //         child: Text('Drawer Header'),
// //       ),
// //       ListTile(
// //         title: const Text('Item 1'),
// //         onTap: () {
// //           // Update the state of the app.
// //           // ...
// //         },
// //       ),
// //       ListTile(
// //         title: const Text('Item 2'),
// //         onTap: () {
// //           // Update the state of the app.
// //           // ...
// //         },
// //       ),
// //     ],
// //   ),
// // ),
// // ),
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   // Handle language change icon press
//                   // Here, you can navigate to a language selection page or toggle between languages
//                   // For demonstration, let's call a method from the language controller to change language
//                   Get.put(LanguageController()).toggleLanguage();
//                 },
//                 icon: SvgPicture.asset(
//                   'assets/icons/language.svg',
//                 ),
//               ),
//               Text(
//                 'Language',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   // Handle notification icon press
//                   // Navigate to the announcement page
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) {
//                         // Replace 'AnnouncementScreen' with your actual announcement screen widget
//                         return AnnouncementScreen();
//                       },
//                     ),
//                   );
//                 },
//                 icon: SvgPicture.asset(
//                   'assets/icons/notification.svg',
//                 ),
//               ),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   padding: EdgeInsets.all(4),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.red,
//                   ),
//                   child: Text(
//                     '1', // Replace with your notification count
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
         
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(50);
// }
import 'package:dozer_mobile/core/language/language_controller.dart';
import 'package:dozer_mobile/presentation/announcement_screen/announcement_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Your App Title'),
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        Expanded(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle language change icon press
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
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                // Handle notification icon press
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnnouncementScreen();
                    },
                  ),
                );
              },
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text(
                  '1', // Replace with your notification count
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
