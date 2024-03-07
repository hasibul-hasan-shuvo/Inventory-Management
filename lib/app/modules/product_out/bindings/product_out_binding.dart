import 'package:get/get.dart';

import '../controllers/product_out_controller.dart';

class ProductOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductOutController>(
      () => ProductOutController(),
    );
  }
}
