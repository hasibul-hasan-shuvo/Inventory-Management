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
          product.updateNumber(1);
          break;
        }
      }
      if (!isListItem) {
        _scannedProductsController.add(ScannedProductUiModel.dummy(code!));
      }

      _scannedProductsController.refresh();
    }
  }
}
