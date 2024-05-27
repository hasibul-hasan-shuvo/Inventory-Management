import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/controllers/scanned_products_controller_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:get/get.dart';

class ProductInController extends BaseController
    with ScannedProductsControllerMixin {
  final InventoryRepository _repository = Get.find();

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == code) {
          isListItem = true;
          product.updateNumber(product.number + 1);
          break;
        }
      }
      if (!isListItem) {
        _getProduct(code!);
      } else {
        onRefresh();
      }
    }
  }

  void onUpdateProduct(List<ScannedProductUiModel> items) {
    onRefresh();
  }

  void updateProductNumber(String id, String numberString) {
    if (!numberString.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization.messageInvalidNumber);

      return;
    }
    int number = numberString.toInt;

    if (number == 0) {
      scannedProducts.removeWhere((element) => element.itemId == id);
    } else {
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == id) {
          product.updateNumber(number);
          break;
        }
      }
    }
    onRefresh();
  }

  void incrementProductNumber(ScannedProductUiModel product) {
    if (product.number + 1 > AppValues.maxCountValue) {
      showErrorMessage(appLocalization.messageMaxCountThresholdValidation);

      return;
    }
    product.updateNumber(product.number + 1);
    onRefresh();
  }

  void _getProduct(String itemId) {
    callDataService(
      _repository.getInventoryByItemId(itemId),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _handleGetProductSuccessResponse(InventoryEntityData? response) {
    if (response != null) {
      addProduct(ScannedProductUiModel.fromInventoryEntityDataWithDefaultNumber(
          response));
    } else {
      showErrorMessage(appLocalization.messageItemNotFound);
    }
  }

  void revertAllItems() {
    if (scannedProducts.isNotEmpty) {
      ProductsRetrievalRequestBody requestBody = ProductsRetrievalRequestBody(
        data: scannedProducts
            .map((e) => e.toScannedProductsRequestBodyWithCountChange(true))
            .toList(),
      );

      callDataService(
        _repository.retrieveProduct(requestBody),
        onSuccess: _handleRevertAllItemsSuccessResponse,
      );
    }
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
      removeProductByItemId(inventoryData.itemId);
    } else {
      bool isItemExist = false;
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == inventoryData.itemId) {
          isItemExist = true;
          product.updateNumber(inventoryData.number);
          onRefresh();
          break;
        }
      }

      if (!isItemExist) {
        scannedProducts
            .add(ScannedProductUiModel.addProductFromInventory(inventoryData));
      }
    }
  }
}
