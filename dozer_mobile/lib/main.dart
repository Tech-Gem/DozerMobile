import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/routes/route.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    // _firebaseMessaging.getToken().then((String? token) {
    //   assert(token != null);
    //   print('FCM Token: $token');
    // });

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
      ),
    );
  }
}
