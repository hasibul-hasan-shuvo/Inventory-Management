import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/controllers/scanned_products_controller_mixin.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:dental_inventory/app/data/repository/product_count_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:get/get.dart';

class ItemCountController extends BaseController
    with ScannedProductsControllerMixin {
  final ProductCountRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
    _getAllScannedProducts();
  }

  @override
  void onClose() {
    super.onClose();
    ZebraScanner().close();
  }

  void _getAllScannedProducts() {
    callDataService(
      _repository.getProducts(),
      onSuccess: _handleGetAllScannedProductsSuccessResponse,
    );
  }

  void _handleGetAllScannedProductsSuccessResponse(
      List<ScannedProductEntityData> products) {
    for (ScannedProductEntityData product in products) {
      addProduct(ScannedProductUiModel.fromScannedProductEntityData(
        product,
        addStockCount: true,
      ));
    }
  }

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == code) {
          isListItem = true;
          _updateProduct(
            product,
            product.number - product.available,
          );
          break;
        }
      }
      if (!isListItem) {
        _getProduct(code!);
      }
    }
  }

  void incrementProductNumber(ScannedProductUiModel inventory) {
    if (inventory.number + 1 > AppValues.maxCountValue) {
      showErrorMessage(appLocalization.messageMaxCountThresholdValidation);

      return;
    }
    _updateProduct(
      inventory,
      (inventory.number - inventory.available) + 1,
    );
  }

  void _getProduct(String itemId) {
    callDataService(
      _repository.getProductById(itemId),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _handleGetProductSuccessResponse(ScannedProductEntityData? response) {
    if (response != null) {
      addProduct(ScannedProductUiModel.fromScannedProductEntityData(
        response,
        addStockCount: true,
      ));
    } else {
      showErrorMessage(appLocalization.messageItemNotFound);
    }
  }

  void updateAll() {
    if (scannedProducts.isNotEmpty) {
      callDataService(
        _repository.updateAll(),
        onSuccess: _handleUpdateAllSuccessResponse,
      );
    }
  }

  void _handleUpdateAllSuccessResponse(
      List<ScannedProductEntityData> response) {
    if (response.isNotEmpty) {
      showErrorMessage(appLocalization.messageItemsUpdateUnsuccessful);
    } else {
      showSuccessMessage(appLocalization.success);
    }
    updateScannedProductsList(response
        .map((e) => ScannedProductUiModel.fromScannedProductEntityData(
              e,
              addStockCount: true,
            ))
        .toList());
    if (scannedProducts.isEmpty) {
      Get.back();
    }
  }

  void onUpdateCurrentStock(ScannedProductUiModel data, String newStock) {
    if (!newStock.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization.messageInvalidNumber);

      return;
    }
    if (newStock.toInt == 0) {
      _removeProduct(data.id, data.itemId);
    } else {
      _updateProduct(
        data,
        newStock.toInt - data.available,
      );
    }
  }

  @override
  void onProductSelect(SelectableInventoryItemUiModel inventoryData) {
    if (inventoryData.number == 0) {
      _removeProduct(inventoryData.id, inventoryData.itemId);
    } else {
      bool isItemExist = false;
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == inventoryData.itemId) {
          isItemExist = true;
          _updateProduct(
            product,
            inventoryData.number - inventoryData.available,
          );
          break;
        }
      }

      if (!isItemExist) {
        _addProductFromInventory(inventoryData);
      }
    }
  }

  void _addProductFromInventory(SelectableInventoryItemUiModel inventory) {
    callDataService(
      _repository.addProductByInventoryId(
        inventory.id,
        inventory.number - inventory.available,
      ),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _removeProduct(int id, String itemId) {
    callDataService(
      _repository.deleteProductById(id),
      onSuccess: (_) => removeProductByItemId(itemId),
    );
  }

  void _updateProduct(ScannedProductUiModel product, int stockCountChange) {
    callDataService(
      _repository.updateProduct(
        product.id,
        stockCountChange,
      ),
      onSuccess: (_) {
        product.updateNumber(product.available + stockCountChange);
        onRefresh();
      },
    );
  }
}
