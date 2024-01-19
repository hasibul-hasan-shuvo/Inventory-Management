import 'package:dental_inventory/app/modules/contact_us/controllers/contact_us_controller.dart';
import 'package:get/get.dart';

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(
      () => ContactUsController(),
    );
  }
}
