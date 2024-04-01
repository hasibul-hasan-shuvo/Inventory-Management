import 'package:get/get.dart';

import '../controllers/global_inventories_controller.dart';

class GlobalInventoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalInventoriesController>(
      () => GlobalInventoriesController(),
    );
  }
}
