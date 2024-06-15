import 'dart:convert';

import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/routes/route.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // firebaseMessaging.getToken().then((String? token) {
  //   assert(token != null);
  //   print('FCM Token: $token');
  // });

  // For handling notification when app is in foreground
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
  //   print('A new onMessageOpenedApp event was published!: $message');
  //   final json_ = json.encode(message.data);
  //   print('*********************message: $json_');
  //   Get.toNamed(RoutesName.notification,
  //       arguments: {'message': json.encode(message.data)});
  //   print('*********************message: $message');
  // });

  // If app is closed or terminated
//   FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
//     if (message != null) {
//       print('A new onMessageOpenedApp event was published!: $message');
//       Get.toNamed(RoutesName.notification,
//           arguments: {'message': jsonEncode(message.data)});
//     }
//   });
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   runApp(const MyApp());
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print(message.data);
//   print('Handling a background message $message');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 829),
      splitScreenMode: true,
      builder: (context, _) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dozer',
        theme: ThemeData(
          fontFamily: 'poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.textColor),
          useMaterial3: true,
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontSize: 14.sp),
            bodyMedium: TextStyle(fontSize: 12.sp),
          ).apply(
            bodyColor: AppColors.boldBlackColor,
            displayColor: AppColors.textColor,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: RoutesName.intial, // Set initial route
        getPages: AppPages.routes,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
