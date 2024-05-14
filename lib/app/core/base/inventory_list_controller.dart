import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:get/get.dart';

class InventoryListController extends BaseController {
  final InventoryRepository repository = Get.find();

  final RxList<ScannedProductUiModel> _scannedProductsController =
      RxList.empty(growable: true);

  List<ScannedProductUiModel> get scannedProducts => _scannedProductsController;

  void addProduct(ScannedProductUiModel scannedProductUiModel) {}

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
      } else {
        onRefreshProduct();
      }
    }
  }

  void _getProduct(String itemId) {
    callDataService(
      repository.getProduct(itemId),
      onSuccess: _handleGetProductSuccessResponse,
    );
  }

  void _handleGetProductSuccessResponse(InventoryResponse response) {
    _scannedProductsController
        .add(ScannedProductUiModel.fromProductResponseModel(response));
  }

  void removeProduct(ProductRetrievalUpdatedList element) {
    _scannedProductsController.removeWhere(
        (scannedProduct) => element.itemId == scannedProduct.itemId);
  }

  void onRefreshProduct() {
    _scannedProductsController.refresh();
  }
}
