import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:get/get.dart';

class ItemCountController extends BaseController {
  final InventoryRepository _repository = Get.find();

  final RxList<ScannedProductUiModel> _inventoriesController =
      RxList.empty(growable: true);

  List<ScannedProductUiModel> get inventories => _inventoriesController;

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ScannedProductUiModel inventory in inventories) {
        if (inventory.itemId == code) {
          isListItem = true;
          inventory.updateNumber(inventory.number + 1);
          break;
        }
      }
      if (!isListItem) {
        _getProduct(code!);
      } else {
        _inventoriesController.refresh();
      }
    }
  }

  void incrementProductNumber(ScannedProductUiModel inventory) {
    if (inventory.number + 1 > AppValues.maxCountValue) {
      showErrorMessage(appLocalization.messageMaxCountThresholdValidation);

      return;
    }
    inventory.updateNumber(inventory.number + 1);
    _inventoriesController.refresh();
  }

  void _getProduct(String itemId) {
    callDataService(
      _repository.getProduct(itemId),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _handleGetProductSuccessResponse(InventoryResponse response) {
    _inventoriesController
        .add(ScannedProductUiModel.fromProductResponseModel(response));
  }

  void updateAll() {
    if (inventories.isNotEmpty) {
      ProductsRetrievalRequestBody requestBody = ProductsRetrievalRequestBody(
        data: inventories
            .map((e) => e.toScannedProductsRequestBodyWithCurrentStock())
            .toList(),
      );

      callDataService(
        _repository.retrieveProduct(requestBody),
        onSuccess: _handleUpdateAllSuccessResponse,
      );
    }
  }

  void _handleUpdateAllSuccessResponse(ProductRetrievalResponse response) {
    if (response.updatedList == null || response.updatedList!.isEmpty) {
      showErrorMessage(appLocalization.messageItemsUpdateUnsuccessful);
    } else {
      showSuccessMessage(response.message ?? appLocalization.success);

      response.updatedList?.forEach((element) {
        _inventoriesController.removeWhere(
            (scannedProduct) => element.itemId == scannedProduct.itemId);
      });

      if (inventories.isEmpty) {
        Get.back();
      }
    }
  }

  void onUpdateCurrentStock(ScannedProductUiModel data, String newStock) {
    if (newStock.toInt > 0) {
      data.updateNumber(newStock.toInt);
      _inventoriesController.refresh();
    } else {
      _inventoriesController
          .removeWhere((element) => element.itemId == data.itemId);
    }
  }
}
