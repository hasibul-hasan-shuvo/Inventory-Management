import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:get/get.dart';

class ProductOutController extends BaseController {
  final RxList<ScannedProductUiModel> _scannedProductsController =
      RxList.empty(growable: true);

  List<ScannedProductUiModel> get scannedProducts => _scannedProductsController;

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.id == code) {
          isListItem = true;
          if (product.number + 1 < product.available) {
            product.updateNumber(product.number + 1);
          }
          break;
        }
      }
      if (!isListItem) {
        _scannedProductsController.add(ScannedProductUiModel.dummy(code!));
      }

      _scannedProductsController.refresh();
    }
  }

  void updateProductNumber(String id, int number) {
    if (number == 0) {
      scannedProducts.removeWhere((element) => element.id == id);
    } else {
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.id == id) {
          product.updateNumber(number);
          break;
        }
      }
    }
    _scannedProductsController.refresh();
  }
}
