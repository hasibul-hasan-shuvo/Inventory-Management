import 'package:get/get.dart';

import '../controllers/suggested_orders_controller.dart';

class SuggestedOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuggestedOrdersController>(
      () => SuggestedOrdersController(),
    );
  }
}
