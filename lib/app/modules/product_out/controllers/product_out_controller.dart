import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/controllers/scanned_products_controller_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:get/get.dart';

class ProductOutController extends BaseController
    with ScannedProductsControllerMixin {
  final InventoryRepository _repository = Get.find();

  // final RxList<ScannedProductUiModel> _scannedProductsController =
  //     RxList.empty(growable: true);
  //
  // List<ScannedProductUiModel> get scannedProducts => _scannedProductsController;

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == code) {
          isListItem = true;
          if (product.number + 1 <= product.available) {
            product.updateNumber(product.number + 1);
          }
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
      scannedProducts.removeWhere((element) => element.itemId == data.itemId);
    } else {
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == data.itemId) {
          product.updateNumber(number);
          break;
        }
      }
    }
    onRefresh();
  }

  void incrementProductNumber(ScannedProductUiModel product) {
    if (product.number >= AppValues.maxCountValue) {
      showErrorMessage(appLocalization.messageMaxCountThresholdValidation);

      return;
    }
    if (product.number + 1 <= product.available) {
      product.updateNumber(product.number + 1);
      onRefresh();
    } else {
      showErrorMessage(appLocalization.messageItemOutValidation);
    }
  }

  void _getProduct(String itemId) {
    callDataService(
      _repository.getProduct(itemId),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _handleGetProductSuccessResponse(InventoryResponse response) {
    addProduct(ScannedProductUiModel.fromProductResponseModel(response));
  }

  void retrieveAllItems() {
    if (scannedProducts.isNotEmpty) {
      ProductsRetrievalRequestBody requestBody = ProductsRetrievalRequestBody(
        data: scannedProducts
            .map((e) => e.toScannedProductsRequestBody(false))
            .toList(),
      );

      callDataService(
        _repository.retrieveProduct(requestBody),
        onSuccess: _handleRetrieveAllItemsSuccessResponse,
      );
    }
  }

  void _handleRetrieveAllItemsSuccessResponse(
      ProductRetrievalResponse response) {
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
    bool itemExistOnScanned = false;
    if (inventoryData.number + 1 < inventoryData.available) {
      for (var product in scannedProducts) {
        if (inventoryData.itemId == product.itemId) {
          itemExistOnScanned = true;
          inventoryData.updateNumber(inventoryData.number + 1);
          product.updateNumber(product.number + 1);
          break;
        }
      }
    }

    if (!itemExistOnScanned) {
      scannedProducts
          .add(ScannedProductUiModel.addProductFromInventory(inventoryData));
    } else {
      onRefresh();
    }
  }
}
