import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/controllers/scanned_products_controller_mixin.dart';
import 'package:dental_inventory/app/core/services/scanner/scanner_service.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:dental_inventory/app/data/repository/product_out_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:get/get.dart';

class ProductOutController extends BaseController
    with ScannedProductsControllerMixin {
  final ProductOutRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
    _getAllScannedProducts();
  }

  @override
  void onClose() {
    closeScannedProductsControllers();
    ScannerService().close();
    super.onClose();
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
      addProduct(ScannedProductUiModel.fromScannedProductEntityData(product));
    }
  }

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == code) {
          isListItem = true;

          if (product.number + 1 <= product.available) {
            _updateProduct(product, product.number + 1);
          } else {
            showErrorMessage(appLocalization.messageItemOutOfStock);
          }
          break;
        }
      }
      if (!isListItem) {
        _getProduct(code!);
      }
    }
  }

  void updateProductNumber(ScannedProductUiModel data, String numberString) {
    if (!numberString.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization.messageInvalidNumber);

      return;
    }

    int number = numberString.toInt;

    if (number > data.available) {
      showErrorMessage(appLocalization.messageItemOutValidation);

      return;
    }

    if (number == 0) {
      _removeProduct(data.itemId);
    } else {
      _updateProduct(data, number);
    }
  }

  void incrementProductNumber(ScannedProductUiModel product) {
    if (product.number >= AppValues.maxCountValue) {
      showErrorMessage(appLocalization.messageMaxCountThresholdValidation);

      return;
    }
    if (product.number + 1 <= product.available) {
      _updateProduct(product, product.number + 1);
    } else {
      showErrorMessage(appLocalization.messageItemOutValidation);
    }
  }

  void _getProduct(String itemId) {
    callDataService(
      _repository.getProductById(itemId),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _handleGetProductSuccessResponse(ScannedProductEntityData? response) {
    if (response != null) {
      addProduct(ScannedProductUiModel.fromScannedProductEntityData(response));
    } else {
      showErrorMessage(appLocalization.messageItemNotFound);
    }
  }

  void retrieveAllItems() {
    if (scannedProducts.isNotEmpty) {
      callDataService(
        _repository.retrieveAllItems(),
        onSuccess: _handleRetrieveAllItemsSuccessResponse,
      );
    }
  }

  void _handleRetrieveAllItemsSuccessResponse(
      List<ScannedProductEntityData> response) {
    if (response.isNotEmpty) {
      showErrorMessage(appLocalization.messageItemsUpdateUnsuccessful);
    } else {
      showSuccessMessage(appLocalization.success);
    }
    updateScannedProductsList(response
        .map((e) => ScannedProductUiModel.fromScannedProductEntityData(e))
        .toList());
  }

  @override
  void onProductSelect(SelectableInventoryItemUiModel inventoryData) {
    if (inventoryData.number == 0) {
      _removeProduct(inventoryData.itemId);
    } else {
      bool isItemExist = false;
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == inventoryData.itemId) {
          isItemExist = true;
          _updateProduct(product, inventoryData.number);
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
      _repository.addProductByItemId(
        inventory.itemId,
        inventory.number,
      ),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _removeProduct(String itemId) {
    callDataService(
      _repository.deleteProductByItemId(itemId),
      onSuccess: (_) => removeProductByItemId(itemId),
    );
  }

  void _updateProduct(ScannedProductUiModel product, int stockCountChange) {
    callDataService(
      _repository.updateProduct(
        product.itemId,
        stockCountChange,
      ),
      onSuccess: (_) {
        product.updateNumber(stockCountChange);
        onRefresh();
      },
    );
  }
}
