import 'package:flextrip/app/modules/Dashborder/veiw/Dashborder.dart';
import 'package:flextrip/app/modules/api_log/bindings/api_log_binding.dart';
import 'package:flextrip/app/modules/api_log/views/api_log_view.dart';
import 'package:flextrip/app/modules/blocked_view.dart';
import 'package:flextrip/app/modules/destination/bindings/destination_binding.dart';
import 'package:flextrip/app/modules/destination/views/destination_view.dart';
import 'package:flextrip/app/modules/edit_profile/bindings/edit_profile_binding.dart';
import 'package:flextrip/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:flextrip/app/modules/home/bindings/home_binding.dart';
import 'package:flextrip/app/modules/home/views/home_view.dart';

import 'package:flextrip/app/modules/login/bindings/login_binding.dart';
import 'package:flextrip/app/modules/login/views/login_view.dart';
import 'package:flextrip/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:flextrip/app/modules/onboarding/views/onboarding_view.dart';
import 'package:flextrip/app/modules/order/bindings/order_binding.dart';
import 'package:flextrip/app/modules/order/views/order_detail_view.dart';
import 'package:flextrip/app/modules/order/views/order_success_view.dart';
import 'package:flextrip/app/modules/order/views/order_view.dart';
import 'package:flextrip/app/modules/pin/bindings/pin_binding.dart';
import 'package:flextrip/app/modules/pin/test11.dart';
import 'package:flextrip/app/modules/pin/views/pin_view.dart';
import 'package:flextrip/app/modules/register/bindings/register_binding.dart';
import 'package:flextrip/app/modules/register/views/register_success_view.dart';
import 'package:flextrip/app/modules/register/views/register_view.dart';
import 'package:flextrip/app/modules/splash_screen_view.dart';
import 'package:flextrip/app/modules/ticket_detail/bindings/ticket_detail_binding.dart';
import 'package:flextrip/app/modules/ticket_detail/views/ticket_detail_view.dart';
import 'package:flextrip/app/modules/topup/bindings/topup_binding.dart';
import 'package:flextrip/app/modules/topup/views/topup_view.dart';
import 'package:flextrip/app/modules/under_development.dart';
import 'package:get/get.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
     
    //   GetPage(
    //   name: _Paths.IntroductionScreen,
    //   page: () =>  IntroductionScreen(),
    // ),
    GetPage(
      name: _Paths.BLOCKED,
      page: () => const BlockedView(),
    ),
    GetPage(
      name: _Paths.UNDER_DEVELOPMENT,
      page: () => const UnderDevelopmentView(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
    ),
    // widget.animationController.forward();
    
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.API_LOG,
      page: () => const ApiLogView(),
      binding: ApiLogBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SUCCESS,
      page: () => const RegisterSuccessView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DESTINATION,
      page: () => const DestinationView(),
      binding: DestinationBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => const OrderDetailView(),
      binding: OrderBinding(),
    ),
    // GetPage(
    //   name: _Paths.ORDER_SUCCESS,
    //   page: () => const OrderSuccessView(),
    //   binding: OrderBinding(),
    // ),
     GetPage(
      name: _Paths.TOPUP,
      page: () =>  test11(),
      binding: TopupBinding(),
    ),
    // GetPage(
    //   name: _Paths.PIN,
    //   page: () => const test11(),
    //   binding: PinBinding(),
    // ),
    GetPage(
      name: _Paths.TICKET_DETAIL,
      page: () => const TicketDetailView(),
      binding: TicketDetailBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
