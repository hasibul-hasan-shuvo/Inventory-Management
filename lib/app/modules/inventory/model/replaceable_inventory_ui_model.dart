import 'package:dental_inventory/app/modules/global_inventories/models/global_inventory_ui_model.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_ui_model.dart';

class ReplaceableInventoryUiModel {
  final InventoryUiModel unavailableInventory;
  final GlobalInventoryUiModel availableInventory;

  ReplaceableInventoryUiModel({
    required this.unavailableInventory,
    required this.availableInventory,
  });
}
