import 'package:dental_inventory/app/modules/about_us/controllers/about_app_controller.dart';
import 'package:get/get.dart';

class AboutAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutAppController>(
      () => AboutAppController(),
    );
  }
}
