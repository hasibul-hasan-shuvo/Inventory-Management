import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/controllers/scanned_products_controller_mixin.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/repository/product_in_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:get/get.dart';

class ProductInController extends BaseController
    with ScannedProductsControllerMixin {
  final ProductInRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
    _getAllScannedProducts();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    ZebraScanner().close();

    return super.onDelete;
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
          _updateProduct(product, product.number + 1);
          break;
        }
      }
      if (!isListItem) {
        _getProduct(code!);
      }
    }
  }

  void updateProductNumber(String id, String numberString) {
    if (!numberString.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization.messageInvalidNumber);

      return;
    }
    int number = numberString.toInt;

    for (ScannedProductUiModel product in scannedProducts) {
      if (product.itemId == id) {
        if (number == 0) {
          _removeProduct(product.id, product.itemId);
        } else {
          _updateProduct(product, number);
        }
        break;
      }
    }
  }

  void incrementProductNumber(ScannedProductUiModel product) {
    if (product.number + 1 > AppValues.maxCountValue) {
      showErrorMessage(appLocalization.messageMaxCountThresholdValidation);

      return;
    }
    _updateProduct(product, product.number + 1);
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

  void revertAllItems() {
    // if (scannedProducts.isNotEmpty) {
    //   ProductsRetrievalRequestBody requestBody = ProductsRetrievalRequestBody(
    //     data: scannedProducts
    //         .map((e) => e.toScannedProductsRequestBodyWithCountChange(true))
    //         .toList(),
    //   );
    //
    //   callDataService(
    //     _repository.retrieveProduct(requestBody),
    //     onSuccess: _handleRevertAllItemsSuccessResponse,
    //   );
    // }
  }

  void _handleRevertAllItemsSuccessResponse(ProductRetrievalResponse response) {
    if (response.updatedList == null || response.updatedList!.isEmpty) {
      showErrorMessage(appLocalization.messageItemsUpdateUnsuccessful);
    } else {
      showSuccessMessage(response.message ?? appLocalization.success);

      response.updatedList?.forEach((element) {
        removeProductByItemId(element.itemId);
      });
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
      _repository.addProductByInventoryId(
        inventory.id,
        inventory.number,
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
        product.updateNumber(stockCountChange);
        onRefresh();
      },
    );
  }
}
