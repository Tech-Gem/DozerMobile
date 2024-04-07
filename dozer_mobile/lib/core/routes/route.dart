import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/pages/home/home_page.dart';
import 'package:dozer_mobile/pages/sign_up/pages/sign_up_page.dart';
import 'package:dozer_mobile/pages/verify_otp/bindings/verify_otp_bindings.dart';
import 'package:dozer_mobile/pages/verify_otp/pages/verify_otp_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: RoutesName.intial,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: RoutesName.otp,
      page: () => VerifyOtpPage(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
    ),
  ];
}
