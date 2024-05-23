import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/controllers/shopping_cart_selectable_inventories_controller.dart';
import 'package:get/get.dart';

class ShoppingCartSelectableInventoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingCartSelectableInventoriesController>(
        () => ShoppingCartSelectableInventoriesController());
  }
}
