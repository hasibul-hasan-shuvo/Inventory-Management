import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/global_inventories/models/global_inventory_ui_model.dart';
import 'package:get/get.dart';

class GlobalInventoriesController extends BaseController {
  final InventoryRepository _repository = Get.find();

  final RxBool _searchModeController = RxBool(true);

  bool get isSearchable => _searchModeController.value;

  final RxString _searchQueryController = RxString('');

  final RxList<GlobalInventoryUiModel> _inventoriesController =
      RxList.empty(growable: true);

  List<GlobalInventoryUiModel> get inventories => _inventoriesController;

  void changeSearchMode() {
    _searchModeController(!isSearchable);
    _searchQueryController('');
  }

  void updateSearchQuery(String query) {
    _searchQueryController(query);
    _fetchInventoryList();
  }

  void _fetchInventoryList() {
    callDataService(
      _repository.getGlobalInventoryList(
        query: _searchQueryController.value,
      ),
      onSuccess: _handleInventoryListResponse,
    );
  }

  void _handleInventoryListResponse(List<GlobalInventoryResponse> response) {
    _inventoriesController(
      response
          .map((e) => GlobalInventoryUiModel.fromGlobalInventoryResponse(e))
          .toList(),
    );
  }

  void createInventory(String itemId) {
    CreateInventoryRequestBody requestBody =
        CreateInventoryRequestBody(itemId: itemId);

    callDataService(
      _repository.createInventory(requestBody),
      onSuccess: _handleCreateInventorySuccessResponse,
    );
  }

  void _handleCreateInventorySuccessResponse(InventoryResponse response) {
    if (response.id != null) {
      showSuccessMessage(appLocalization.messageCreateInventorySuccessful);
    }
  }

  void onScanned(String? code) {
    if (code != null) {
      createInventory(code);
    }
  }
}
