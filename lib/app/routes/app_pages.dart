import 'package:get/get.dart';

import '../modules/about_us/bindings/about_us_binding.dart';
import '../modules/about_us/views/about_us_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/delivery/bindings/delivery_binding.dart';
import '../modules/delivery/views/delivery_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/inventory/bindings/inventory_binding.dart';
import '../modules/inventory/views/inventory_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/other/bindings/other_binding.dart';
import '../modules/other/views/other_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/suggested_orders/bindings/suggested_orders_binding.dart';
import '../modules/suggested_orders/views/suggested_orders_view.dart';

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
      name: _Paths.INVENTORY,
      page: () => InventoryView(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SUGGESTED_ORDERS,
      page: () => SuggestedOrdersView(),
      binding: SuggestedOrdersBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY,
      page: () =>  DeliveryView(),
      binding: DeliveryBinding(),
    ),
  ];
}
