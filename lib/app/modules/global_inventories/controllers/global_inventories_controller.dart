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

  final Rx<GlobalInventoryUiModel?> addInventoryController = Rx(null);

  final Rx<GlobalInventoryUiModel?> alternativeInventoryController = Rx(null);

  void changeSearchMode() {
    _searchModeController(!isSearchable);
    _searchQueryController('');
  }

  void updateSearchQuery(String query) {
    _searchQueryController(query);
    _fetchInventoryList();
  }

  void _fetchInventoryList() {
    if (_searchQueryController.isNotEmpty) {
      callDataService(
        _repository.getGlobalInventoryList(
          query: _searchQueryController.value,
        ),
        onSuccess: _handleInventoryListResponse,
      );
    } else {
      _inventoriesController.clear();
    }
  }

  void _handleInventoryListResponse(List<GlobalInventoryResponse> response) {
    _inventoriesController(
      response
          .map((e) => GlobalInventoryUiModel.fromGlobalInventoryResponse(e))
          .toList(),
    );
  }

  void _getInventoryData(String id, bool isAlternativeProduct) {
    callDataService(
      _repository.getGlobalInventory(id),
      onSuccess: (response) => _handleGetInventoryDataSuccessResponse(
        response,
        isAlternativeProduct,
      ),
    );
  }

  void _handleGetInventoryDataSuccessResponse(
    GlobalInventoryResponse response,
    bool isAlternativeProduct,
  ) {
    GlobalInventoryUiModel data =
        GlobalInventoryUiModel.fromGlobalInventoryResponse(response);

    if (isAlternativeProduct) {
      alternativeInventoryController.trigger(data);
    } else {
      addInventoryController.trigger(data);
    }
  }

  void createInventory(GlobalInventoryUiModel data) {
    CreateInventoryRequestBody requestBody =
        CreateInventoryRequestBody(itemId: data.itemId);

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

  void onTapAddProduct(GlobalInventoryUiModel data) {
    if (data.isOutdated && data.alternativeProductId.isEmpty) {
      showErrorMessage(appLocalization.messageInventoryUnavailable);

      return;
    }

    if (data.isOutdated && data.alternativeProductId.isNotEmpty) {
      _getInventoryData(
        data.alternativeProductId,
        true,
      );
    } else {
      addInventoryController.trigger(data);
    }
  }

  void onScanned(String? code) {
    if (code != null) {
      _getInventoryData(
        code,
        false,
      );
    }
  }
}
