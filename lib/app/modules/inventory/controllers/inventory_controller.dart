import 'dart:convert';

import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/services/offline_service/data_sync_manager.dart';
import 'package:dental_inventory/app/core/services/offline_service/models/data_synchronizer_key.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/request/inventory_update_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/global_inventories/models/global_inventory_ui_model.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_ui_model.dart';
import 'package:dental_inventory/app/modules/inventory/model/replaceable_inventory_ui_model.dart';
import 'package:dental_inventory/app/network/exceptions/api_exception.dart';
import 'package:dental_inventory/app/network/exceptions/base_exception.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class InventoryController extends BaseController {
  final RxList<InventoryUiModel> _inventoryItemsController =
      RxList.empty(growable: true);

  List<InventoryUiModel> get inventoryItems => _inventoryItemsController;

  final RxBool _searchModeController = RxBool(false);

  bool get isSearchable => _searchModeController.value;

  final RxString searchQuery = ''.obs;

  final InventoryRepository _repository = Get.find<InventoryRepository>();

  final Rx<ReplaceableInventoryUiModel?> replaceableInventoryController =
      Rx(null);

  final Rx<InventoryUiModel?> noReplaceableInventoryController = Rx(null);

  final Rx<InventoryUiModel?> replaceableInvalidAlternativeInventoryController =
      Rx(null);

  @override
  void onInit() {
    super.onInit();
    _fetchInventoryList();
  }

  @override
  void onClose() {
    _inventoryItemsController.close();
    _searchModeController.close();
    searchQuery.close();
    replaceableInventoryController.close();
    noReplaceableInventoryController.close();
    replaceableInvalidAlternativeInventoryController.close();
    super.onClose();
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

  void deleteInventoryItem(InventoryUiModel data) {
    callDataService(
      _repository.deleteInventory(
        id: data.id,
        itemId: data.itemId,
      ),
      onSuccess: (e) => _deleteSuccessHandler(data),
    );
  }

  void _deleteSuccessHandler(InventoryUiModel data) {
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
      _repository.getInventoryList(
        queryParams: queryParams,
      ),
      onSuccess: _handleFetchInventoryListSuccessResponse,
    );
  }

  void _handleFetchInventoryListSuccessResponse(
      List<InventoryEntityData> response) {
    List<InventoryUiModel> list = [];
    pagingController.nextPage();
    pagingController.isLastPage =
        response.isEmpty && response.length < AppValues.defaultPageSize;
    for (InventoryEntityData inventory in response) {
      list.add(InventoryUiModel.fromInventoryEntityData(inventory));
    }
    _inventoryItemsController(list);
  }

  void _getNextInventoryList() {
    InventoryListQueryParams queryParams = InventoryListQueryParams(
      search: searchQuery.value,
      page: pagingController.pageNumber,
    );
    callDataService(
      _repository.getInventoryList(
        queryParams: queryParams,
      ),
      onSuccess: _handleNextInventoryListSuccessResponse,
      onStart: () => logger.d("Fetching more inventories..."),
      onComplete: () => refreshController.loadComplete(),
    );
  }

  void _handleNextInventoryListSuccessResponse(
      List<InventoryEntityData> response) {
    List<InventoryUiModel> list = [];
    pagingController.nextPage();
    pagingController.isLastPage =
        response.isEmpty && response.length < AppValues.defaultPageSize;
    for (InventoryEntityData inventory in response) {
      list.add(InventoryUiModel.fromInventoryEntityData(inventory));
    }
    _inventoryItemsController.addAll(list);
  }

  void updateInventoryData({
    required InventoryUiModel data,
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
        stockCountChange: stockCount.toInt - data.currentStock,
        fixedSuggestion: fixedSuggestion.toInt,
      );
      callDataService(
        _repository.updateInventoryData(request),
        onSuccess: _handleUpdateInventoryDataSuccessResponse,
      );
    }
  }

  void _handleUpdateInventoryDataSuccessResponse(
      InventoryEntityData? response) {
    DataSyncManager().syncDataWithServer([DataSynchronizerKey.INVENTORY]);

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

  void onTapUnavailableInventory(InventoryUiModel data) {
    if (data.alternativeItemId.isEmpty) {
      noReplaceableInventoryController.trigger(data);
    } else if (!data.hasAlternativeValidId) {
      replaceableInvalidAlternativeInventoryController.trigger(data);
    } else {
      _getAlternativeInventory(data);
    }
  }

  void clearReplaceableInventoryController() {
    replaceableInventoryController(null);
  }

  void clearNoReplaceableInventoryController() {
    noReplaceableInventoryController(null);
  }

  void clearReplaceableInvalidAlternativeController() {
    replaceableInvalidAlternativeInventoryController(null);
  }

  void _getAlternativeInventory(InventoryUiModel unavailableInventory) {
    callDataService(
      _repository.getGlobalInventory(unavailableInventory.alternativeItemId),
      enableErrorMessage: false,
      onSuccess: (response) =>
          _handleGetAlternativeInventoryDataSuccessResponse(
        response,
        unavailableInventory,
      ),
      onError: (e) {
        if (e is ApiException && e.httpCode == HttpStatus.notFound) {
          noReplaceableInventoryController.trigger(unavailableInventory);
        } else {
          showErrorMessage(e is BaseException ? e.message : e.toString());
        }
      },
    );
  }

  void _handleGetAlternativeInventoryDataSuccessResponse(
    GlobalInventoryResponse response,
    InventoryUiModel unavailableInventory,
  ) {
    replaceableInventoryController.trigger(
      ReplaceableInventoryUiModel(
        unavailableInventory: unavailableInventory,
        availableInventory:
            GlobalInventoryUiModel.fromGlobalInventoryResponse(response),
      ),
    );
  }

  void replaceInventory(ReplaceableInventoryUiModel data) {
    ProductResponse product = ProductResponse(
      itemId: data.availableInventory.itemId,
      name: data.availableInventory.name,
      imageUrl: data.availableInventory.imageUrl,
    );
    String productJsonString = jsonEncode(product.toJson());
    CreateInventoryRequestBody newInventory = CreateInventoryRequestBody(
      itemId: data.availableInventory.itemId,
      productName: data.availableInventory.name,
      product: productJsonString,
      maxCount: data.unavailableInventory.max.toString(),
      minCount: data.unavailableInventory.min.toString(),
      stockCount: data.unavailableInventory.currentStock.toString(),
      fixedSuggestion:
          data.unavailableInventory.fixedOrderSuggestions.toString(),
    );
    callDataService(
      _repository.replaceInventory(
        oldInventoryId: data.unavailableInventory.id,
        oldInventoryItemId: data.unavailableInventory.itemId,
        newInventory: newInventory,
      ),
      onSuccess: _handleReplaceInventoryResponse,
    );
  }

  void _handleReplaceInventoryResponse(InventoryEntityData? newInventory) {
    if (newInventory != null) {
      showSuccessMessage(appLocalization.messageReplaceInventorySuccessful);
      _fetchInventoryList();
    }
  }
}
