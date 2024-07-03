import 'package:dental_inventory/app/modules/inventory/model/inventory_ui_model.dart';

class ReplaceableInventoryUiModel {
  final InventoryUiModel unavailableInventory;
  final InventoryUiModel availableInventory;

  ReplaceableInventoryUiModel({
    required this.unavailableInventory,
    required this.availableInventory,
  });
}
