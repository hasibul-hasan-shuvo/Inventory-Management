import 'dart:convert';

import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/services/scanner/scanner_service.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/global_inventories/models/global_inventory_ui_model.dart';
import 'package:dental_inventory/app/modules/global_inventories/models/global_unavailable_product_ui_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GlobalInventoriesController extends BaseController {
  final TextEditingController searchController = TextEditingController();

  final InventoryRepository _repository = Get.find();

  final RxBool _searchModeController = RxBool(true);

  bool get isSearchable => _searchModeController.value;

  final RxString _searchQueryController = RxString('');

  final RxList<GlobalInventoryUiModel> _inventoriesController =
      RxList.empty(growable: true);

  List<GlobalInventoryUiModel> get inventories => _inventoriesController;

  final Rx<GlobalInventoryUiModel?> addInventoryController = Rx(null);

  final Rx<GlobalUnavailableProductUiModel?> alternativeInventoryController =
      Rx(null);

  @override
  void onClose() {
    super.onClose();
    ScannerService().close();
    _searchModeController.close();
    _searchQueryController.close();
    _inventoriesController.close();
    addInventoryController.close();
    alternativeInventoryController.close();
  }

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

  void _getInventoryData({
    required String availableProductId,
    String unavailableProductId = '',
    String unavailableProductName = '',
    bool isAlternativeProduct = false,
  }) {
    callDataService(
      _repository.getGlobalInventory(availableProductId),
      onSuccess: (response) => _handleGetInventoryDataSuccessResponse(
        response,
        unavailableProductId,
        unavailableProductName,
        isAlternativeProduct,
      ),
    );
  }

  void _handleGetInventoryDataSuccessResponse(
    GlobalInventoryResponse response,
    String unavailableProductId,
    String unavailableProductName,
    bool isAlternativeProduct,
  ) {
    GlobalInventoryUiModel data =
        GlobalInventoryUiModel.fromGlobalInventoryResponse(response);

    if (isAlternativeProduct) {
      alternativeInventoryController.trigger(
        GlobalUnavailableProductUiModel(
          unavailableProductName: unavailableProductName,
          availableProduct: data,
        ),
      );
    } else {
      addInventoryController.trigger(data);
    }
  }

  void createInventory({
    required GlobalInventoryUiModel data,
    String maxCount = '',
    String minCount = '',
    String stockCount = '',
    String fixedSuggestion = '',
  }) {
    if (_checkValuesValidity(
      maxCount: maxCount,
      minCount: minCount,
      stockCount: stockCount,
      fixedSuggestion: fixedSuggestion,
    )) {
      ProductResponse product = ProductResponse(
        itemId: data.itemId,
        name: data.name,
        imageUrl: data.imageUrl,
      );
      String productJsonString = jsonEncode(product.toJson());
      CreateInventoryRequestBody requestBody = CreateInventoryRequestBody(
        itemId: data.itemId,
        productName: data.name,
        product: productJsonString,
        maxCount: maxCount,
        minCount: minCount,
        stockCount: stockCount,
        fixedSuggestion: fixedSuggestion,
      );

      callDataService(
        _repository.createInventory(requestBody),
        onSuccess: _handleCreateInventorySuccessResponse,
      );
    }
  }

  void _handleCreateInventorySuccessResponse(InventoryEntityData? response) {
    if (response != null) {
      showSuccessMessage(appLocalization.messageCreateInventorySuccessful);
    } else {
      showErrorMessage(appLocalization.error);
    }
  }

  void onTapAddProduct(GlobalInventoryUiModel data) {
    if (data.isOutdated && data.alternativeProductId.isEmpty) {
      showErrorMessage(appLocalization.messageInventoryUnavailable);

      return;
    }

    if (data.isOutdated && data.alternativeProductId.trim().isNotEmpty) {
      _getInventoryData(
        availableProductId: data.alternativeProductId,
        unavailableProductId: data.itemId,
        unavailableProductName: data.name,
        isAlternativeProduct: true,
      );
    } else {
      addInventoryController.trigger(data);
    }
  }

  void onScanned(String? code) {
    if (code != null) {
      _getInventoryData(availableProductId: code);
    }
  }

  bool _checkValuesValidity({
    required String maxCount,
    required String minCount,
    required String stockCount,
    required String fixedSuggestion,
  }) {
    if (maxCount.isEmpty &&
        minCount.isEmpty &&
        stockCount.isEmpty &&
        fixedSuggestion.isEmpty) {
      return true;
    }

    if (!maxCount.isPositiveIntegerNumber) {
      _showInvalidValueErrorMessage(appLocalization.max);

      return false;
    }

    if (!minCount.isPositiveIntegerNumber) {
      _showInvalidValueErrorMessage(appLocalization.min);

      return false;
    }

    if (stockCount.isNotNullOrEmpty && !stockCount.isPositiveIntegerNumber) {
      _showInvalidValueErrorMessage(appLocalization.inventory);

      return false;
    }

    if (fixedSuggestion.isNotNullOrEmpty &&
        !fixedSuggestion.isPositiveIntegerNumber) {
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
