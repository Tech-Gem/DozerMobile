import 'package:dozer_mobile/core/constants/app_text_style.dart';
import 'package:dozer_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 829),
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dozer',
        theme: ThemeData(
          fontFamily: 'poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
          textTheme: TextTheme(
            bodyLarge: bodyTextStyle,
            bodyMedium: bodyMediumStyle,
          ).apply(
            bodyColor: AppColors.primaryColor,
            displayColor: AppColors.textColor,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
