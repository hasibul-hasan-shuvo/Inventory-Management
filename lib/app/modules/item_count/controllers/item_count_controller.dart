import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
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
      int index = inventories.indexWhere((product) => product.itemId == code);
      if (index == -1) {
        _getProduct(code!);
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
}
