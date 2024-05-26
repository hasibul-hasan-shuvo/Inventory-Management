import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/request/inventory_update_request_body.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_ui_model.dart';
import 'package:get/get.dart';

class InventoryController extends BaseController {
  final RxList<InventoryUIModel> _inventoryItemsController =
      RxList.empty(growable: true);

  List<InventoryUIModel> get inventoryItems => _inventoryItemsController;

  final RxBool _searchModeController = RxBool(false);

  bool get isSearchable => _searchModeController.value;

  final RxString searchQuery = ''.obs;

  final InventoryRepository _inventoryRepository =
      Get.find<InventoryRepository>();

  @override
  void onInit() {
    super.onInit();
    _fetchInventoryList();
  }

  void onLoading() {
    if (pagingController.canLoadNextPage()) {
      _getNextInventoryList();
    }
  }

  void changeSearchMode() {
    _searchModeController(!isSearchable);
    searchQuery('');
    if (!_searchModeController.value) {
      _fetchInventoryList();
    }
  }

  void updateSearchQuery(String query) {
    searchQuery(query);
    _fetchInventoryList();
  }

  void deleteInventoryItem(InventoryUIModel data) {
    callDataService(
      _inventoryRepository.deleteInventory(id: data.id),
      onSuccess: (e) => _deleteSuccessHandler(data),
    );
  }

  void _deleteSuccessHandler(InventoryUIModel data) {
    showSuccessMessage(appLocalization.deleteSuccessMessage);
    _inventoryItemsController
        .removeWhere((element) => element.itemId == data.itemId);
    _inventoryItemsController.refresh();
  }

  void _fetchInventoryList() {
    pagingController.initRefresh();
    InventoryListQueryParams queryParams = InventoryListQueryParams(
      search: searchQuery.value,
      page: pagingController.pageNumber,
    );
    callDataService(
      _inventoryRepository.getInventoryList(
        queryParams: queryParams,
      ),
      onSuccess: _handleFetchInventoryListSuccessResponse,
    );
  }

  void _handleFetchInventoryListSuccessResponse(
      List<InventoryEntityData> response) {
    List<InventoryUIModel> list = [];
    pagingController.nextPage();
    pagingController.isLastPage =
        response.isEmpty && response.length < AppValues.defaultPageSize;
    for (InventoryEntityData inventory in response) {
      list.add(InventoryUIModel.fromInventoryEntityData(inventory));
    }
    _inventoryItemsController(list);
  }

  void _getNextInventoryList() {
    InventoryListQueryParams queryParams = InventoryListQueryParams(
      search: searchQuery.value,
      page: pagingController.pageNumber,
    );
    callDataService(
      _inventoryRepository.getInventoryList(
        queryParams: queryParams,
      ),
      onSuccess: _handleNextInventoryListSuccessResponse,
      onStart: () => logger.d("Fetching more inventories..."),
      onComplete: () => refreshController.loadComplete(),
    );
  }

  void _handleNextInventoryListSuccessResponse(
      List<InventoryEntityData> response) {
    List<InventoryUIModel> list = [];
    pagingController.nextPage();
    pagingController.isLastPage =
        response.isEmpty && response.length < AppValues.defaultPageSize;
    for (InventoryEntityData inventory in response) {
      list.add(InventoryUIModel.fromInventoryEntityData(inventory));
    }
    _inventoryItemsController.addAll(list);
  }

  void updateInventoryData({
    required InventoryUIModel data,
    required String maxCount,
    required String minCount,
    required String stockCount,
    required String fixedSuggestion,
  }) {
    if (_checkValuesValidity(
      maxCount: maxCount,
      minCount: minCount,
      stockCount: stockCount,
      fixedSuggestion: fixedSuggestion,
    )) {
      final InventoryUpdateRequestBody request = InventoryUpdateRequestBody(
        id: data.id,
        itemId: data.itemId,
        maxCount: maxCount.toInt,
        minCount: minCount.toInt,
        stockCount: stockCount.toInt,
        inventoryID: authRepository.getInventoryID(),
        stockCountChange: stockCount.toInt - data.currentStock,
        fixedSuggestion: fixedSuggestion.toInt,
      );
      callDataService(
        _inventoryRepository.updateInventoryData(data.id, request),
        onSuccess: _handleUpdateInventoryDataSuccessResponse,
      );
    }
  }

  void _handleUpdateInventoryDataSuccessResponse(
      InventoryEntityData? response) {
    if (response != null) {
      for (var element in inventoryItems) {
        if (element.itemId == response.itemId.toString()) {
          element.updateFromInventoryEntityData(response);
        }
      }

      showSuccessMessage(appLocalization.messageItemUpdatedSuccessfully);
    }
  }

  bool _checkValuesValidity({
    required String maxCount,
    required String minCount,
    required String stockCount,
    required String fixedSuggestion,
  }) {
    if (!maxCount.isPositiveIntegerNumber) {
      _showInvalidValueErrorMessage(appLocalization.max);

      return false;
    }

    if (!minCount.isPositiveIntegerNumber) {
      _showInvalidValueErrorMessage(appLocalization.min);

      return false;
    }

    if (!stockCount.isPositiveIntegerNumber) {
      _showInvalidValueErrorMessage(appLocalization.inventory);

      return false;
    }

    if (!fixedSuggestion.isPositiveIntegerNumber) {
      _showInvalidValueErrorMessage(appLocalization.fixedProposal);

      return false;
    }

    if (!_checkMaxMinValidity(maxCount, minCount)) {
      return false;
    }

    return true;
  }

  bool _checkMaxMinValidity(String max, String min) {
    try {
      int maxCount = max.toInt;
      int minCount = min.toInt;

      if (maxCount < minCount) {
        showErrorMessage(appLocalization.messageMaxMinValidation);

        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  void _showInvalidValueErrorMessage(String itemName) {
    showErrorMessage(appLocalization.messageInvalidItemNumber(itemName));
  }
}
