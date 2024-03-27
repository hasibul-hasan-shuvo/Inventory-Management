import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:get/get.dart';

class ItemCountController extends BaseController {
  final InventoryRepository _repository = Get.find();

  final RxList<InventoryCardUIModel> _inventoriesController =
      RxList.empty(growable: true);

  List<InventoryCardUIModel> get inventories => _inventoriesController;

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (InventoryCardUIModel inventory in inventories) {
        if (inventory.itemId == code) {
          isListItem = true;
          inventory.updateCurrentStock(inventory.currentStock + 1);
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

  void _getProduct(String itemId) {
    callDataService(
      _repository.getProduct(itemId),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _handleGetProductSuccessResponse(InventoryResponse response) {
    _inventoriesController
        .add(InventoryCardUIModel.fromInventoryResponse(response));
  }

  void updateAll() {
    if (inventories.isNotEmpty) {
      ProductsRetrievalRequestBody requestBody = ProductsRetrievalRequestBody(
        data: inventories.map((e) => e.toScannedProductsRequestBody()).toList(),
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

  void onUpdateCurrentStock(InventoryCardUIModel data, String newStock) {
    if (newStock.isEmpty) {
      data.updateCurrentStock(0);
    } else {
      int stock = int.parse(newStock);
      data.updateCurrentStock(stock);
    }
    _inventoriesController.refresh();
  }
}
