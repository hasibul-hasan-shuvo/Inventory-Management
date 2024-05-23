import 'package:dental_inventory/app/modules/selectable_inventory_list/controllers/selectable_inventory_list_controller.dart';
import 'package:get/get.dart';

class SelectableInventoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectableInventoryListController>(
        () => SelectableInventoryListController());
  }
}
