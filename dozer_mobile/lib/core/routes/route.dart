import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/presentation/add_profile_photo/profile_photo_page.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/login_page.dart';
import 'package:dozer_mobile/presentation/booking/booking_form.dart';
import 'package:dozer_mobile/presentation/create_equipment/bindings/create_equipment_binding.dart';
import 'package:dozer_mobile/presentation/create_equipment/create_equipment_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/all_equipments_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/home_screen.dart';
import 'package:dozer_mobile/presentation/forgot_password/forgot_password_page.dart';
import 'package:dozer_mobile/presentation/invoice_generator_screen/invoice_generator.dart';

import 'package:dozer_mobile/presentation/login_screen/login_screen.dart';
import 'package:dozer_mobile/presentation/notification/notification_screen.dart';
import 'package:dozer_mobile/presentation/onboarding/screens/landing_page.dart';
import 'package:dozer_mobile/presentation/sign_up/sign_up_page.dart';
import 'package:dozer_mobile/presentation/verify_otp/bindings/verify_otp_bindings.dart';
import 'package:dozer_mobile/presentation/verify_otp/verify_otp_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();

  static final routes = [
    //   GetPage(
    //     name: RoutesName.intial,
    //     // page: () => BookingForm(availability: 5,imageUrl: 'https://www.deere.co.in/assets/images/region-1/products/tractors/tractor-3d-experience-banner.jpg',equipmentName: 'Tractor',),
    // //  page: () => HomePage(),
    // page:() => HomeScreen()

    //   ),

    GetPage(
      name: RoutesName.intial,
      page: () => LandingPage(),
    ),
    GetPage(
      name: RoutesName.bookingForm,
      page: BookingForm.new,
    ),

    GetPage(
      name: RoutesName.otp,
      page: () => VerifyOtpPage(),
      binding: VerifyOtpBinding(),
    ),

    GetPage(
      name: RoutesName.login,
      page: () => LoginPage(),
    ),

    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
    ),

    GetPage(
      name: RoutesName.signUp,
      page: () => SignUpPage(),
    ),

    GetPage(
      name: RoutesName.forgotPassword,
      page: () => PickImagePage(),
    ),

    GetPage(
      name: RoutesName.createEquipment,
      page: () => CreateEquipmentScreen(),
      binding: CreateEquipmentBinding(),
    ),

    GetPage(
      name: RoutesName.onboarding,
      page: () => LandingPage(),
    ),

    GetPage(
      name: RoutesName.notification,
      page: () =>  NotificationScreen(),
    ),
  ];
}