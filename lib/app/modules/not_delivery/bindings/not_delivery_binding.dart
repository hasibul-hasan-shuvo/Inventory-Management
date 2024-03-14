import 'package:get/get.dart';

import '../controllers/not_delivery_controller.dart';

class NotDeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotDeliveryController>(
      () => NotDeliveryController(),
    );
  }
}
