import 'package:dental_inventory/app/modules/about_us/controllers/about_us_controller.dart';
import 'package:dental_inventory/app/modules/contact_us/controllers/contact_us_controller.dart';
import 'package:get/get.dart';

import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/other/controllers/other_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<OtherController>(
      () => OtherController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<ContactUsController>(
      () => ContactUsController(),
    );
    Get.lazyPut<AboutUsController>(
      () => AboutUsController(),
    );
  }
}
