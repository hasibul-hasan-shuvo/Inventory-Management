import 'package:get/get.dart';

import 'package:dental_inventory/app/modules/contact_us/bindings/contact_us_binding.dart';
import 'package:dental_inventory/app/modules/contact_us/views/contact_us_view.dart';
import 'package:dental_inventory/app/modules/splash/bindings/splash_binding.dart';
import 'package:dental_inventory/app/modules/splash/views/splash_view.dart';
import 'package:dental_inventory/app/modules/home/bindings/home_binding.dart';
import 'package:dental_inventory/app/modules/home/views/home_view.dart';
import 'package:dental_inventory/app/modules/main/bindings/main_binding.dart';
import 'package:dental_inventory/app/modules/main/views/main_view.dart';
import 'package:dental_inventory/app/modules/other/bindings/other_binding.dart';
import 'package:dental_inventory/app/modules/other/views/other_view.dart';
import '../modules/about_us/bindings/about_us_binding.dart';
import '../modules/about_us/views/about_us_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      page: () => OtherView(),
      binding: OtherBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
