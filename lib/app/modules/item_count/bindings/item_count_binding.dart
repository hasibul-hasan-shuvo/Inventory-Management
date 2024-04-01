import 'package:get/get.dart';

import '../controllers/item_count_controller.dart';

class ItemCountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemCountController>(
      () => ItemCountController(),
    );
  }
}
