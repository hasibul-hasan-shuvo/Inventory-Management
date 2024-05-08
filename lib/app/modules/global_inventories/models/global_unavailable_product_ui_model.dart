import 'package:dental_inventory/app/modules/global_inventories/models/global_inventory_ui_model.dart';

class GlobalUnavailableProductUiModel {
  String unavailableProductId;
  GlobalInventoryUiModel availableProduct;

  GlobalUnavailableProductUiModel({
    required this.unavailableProductId,
    required this.availableProduct,
  });
}
