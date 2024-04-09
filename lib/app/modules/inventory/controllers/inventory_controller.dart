import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:get/get.dart';

class InventoryController extends BaseController {
  final RxList<InventoryCardUIModel> _inventoryItemsController =
      RxList.empty(growable: true);

  List<InventoryCardUIModel> get inventoryItems => _inventoryItemsController;

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

  void deleteInventoryItem(InventoryCardUIModel data) {
    callDataService(
      _inventoryRepository.deleteInventory(id: data.id.toString()),
      onSuccess: (e) => _deleteSuccessHandler(data),
    );
  }

  void _deleteSuccessHandler(InventoryCardUIModel data) {
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
      InventoryListResponse response) {
    pagingController.nextPage();
    pagingController.isLastPage = response.next == null;
    List<InventoryCardUIModel> list = response.inventoryList
            ?.map((e) => InventoryCardUIModel.fromInventoryResponse(e))
            .toList() ??
        [];
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

  void _handleNextInventoryListSuccessResponse(InventoryListResponse response) {
    pagingController.nextPage();
    pagingController.isLastPage = response.next == null;
    _inventoryItemsController.addAll(
      response.inventoryList
              ?.map((e) => InventoryCardUIModel.fromInventoryResponse(e))
              .toList() ??
          [],
    );
  }

  void updateInventoryData({
    required InventoryCardUIModel data,
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
      final InventoryCountUpdateRequest request = InventoryCountUpdateRequest(
        id: data.itemId,
        maxCount: maxCount,
        minCount: minCount,
        stockCount: stockCount,
        inventoryID: authRepository.getInventoryID(),
        fixedSuggestion: fixedSuggestion,
      );
      callDataService(
        _inventoryRepository.updateInventoryData(request),
        onSuccess: _handleUpdateInventoryDataSuccessResponse,
      );
    }
  }

  void _handleUpdateInventoryDataSuccessResponse(InventoryResponse response) {
    for (var element in inventoryItems) {
      if (element.itemId == response.product?.itemId.toString()) {
        element.updateFromInventoryResponse(response);
      }
    }

    showSuccessMessage(appLocalization.messageItemUpdatedSuccessfully);
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
