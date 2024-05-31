import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:get/get.dart';

mixin ScannedProductsControllerMixin {
  final RxList<ScannedProductUiModel> _scannedProductsController =
      RxList.empty(growable: true);

  List<ScannedProductUiModel> get scannedProducts => _scannedProductsController;

  void onRefresh() {
    _scannedProductsController.refresh();
  }

  void updateScannedProductsList(List<ScannedProductUiModel> newList) {
    _scannedProductsController(newList);
  }

  void addProduct(ScannedProductUiModel data) {
    _scannedProductsController.add(data);
  }

  void removeProductByItemId(String? itemId) {
    _scannedProductsController
        .removeWhere((scannedProduct) => itemId == scannedProduct.itemId);
    onRefresh();
  }

  void onProductSelect(SelectableInventoryItemUiModel inventoryData);

  void closeScannedProductsControllers() {
    _scannedProductsController.close();
  }
}
