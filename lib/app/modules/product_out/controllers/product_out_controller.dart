import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:get/get.dart';

class ProductOutController extends BaseController {
  final InventoryRepository _repository = Get.find();

  final RxList<ScannedProductUiModel> _scannedProductsController =
      RxList.empty(growable: true);

  List<ScannedProductUiModel> get scannedProducts => _scannedProductsController;

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == code) {
          isListItem = true;
          if (product.number + 1 < product.available) {
            product.updateNumber(product.number + 1);
          }
          break;
        }
      }
      if (!isListItem) {
        _getProduct(code!);
      }

      _scannedProductsController.refresh();
    }
  }

  void updateProductNumber(String id, int number) {
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
    _scannedProductsController.refresh();
  }

  void _getProduct(String itemId) {
    callDataService(
      _repository.getProduct(itemId),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _handleGetProductSuccessResponse(InventoryResponse response) {
    _scannedProductsController
        .add(ScannedProductUiModel.fromProductResponseModel(response));
  }

  void retrieveAllItems() {
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

  void _handleRetrieveAllItemsSuccessResponse(
      ProductRetrievalResponse response) {
    showSuccessMessage(response.message ?? appLocalization.success);

    response.updatedList?.forEach((element) {
      _scannedProductsController.removeWhere(
          (scannedProduct) => element.itemId == scannedProduct.itemId);
    });
  }
}
