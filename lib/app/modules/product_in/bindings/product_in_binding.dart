import 'package:get/get.dart';

import '../controllers/product_in_controller.dart';

class ProductInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductInController>(
      () => ProductInController(),
    );
  }
}
