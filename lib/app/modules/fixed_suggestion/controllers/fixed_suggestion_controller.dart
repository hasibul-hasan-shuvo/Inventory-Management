import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/request/list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository.dart';
import 'package:dental_inventory/app/modules/suggested_orders/models/suggested_order_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FixedSuggestionController extends BaseController {
  final SuggestedOrdersRepository _repository = Get.find();

  final TextEditingController searchController = TextEditingController();

  final RxBool _searchModeController = RxBool(false);

  bool get isSearchable => _searchModeController.value;

  final RxList<SuggestedOrderUiModel> _suggestedOrdersController =
      RxList.empty(growable: true);

  List<SuggestedOrderUiModel> get suggestedOrders => _suggestedOrdersController;

  @override
  void onInit() {
    super.onInit();
    _getSuggestedOrders();
  }

  @override
  void onClose() {
    for (var element in _suggestedOrdersController) {
      element.close();
    }
    _suggestedOrdersController.close();
    super.onClose();
  }

  void changeSearchMode() {
    _searchModeController(!isSearchable);
    searchController.text = '';
    if (!_searchModeController.value) {
      _getSuggestedOrders();
    }
  }

  void updateSearchQuery(String query) {
    _getSuggestedOrders();
  }

  void onLoading() {
    if (pagingController.canLoadNextPage()) {
      _getNextSuggestedOrders();
    }
  }

  void _getSuggestedOrders() {
    pagingController.initRefresh();
    ListQueryParams queryParams = ListQueryParams(
      page: pagingController.pageNumber,
      search: searchController.text,
    );

    callDataService(
      _repository.getFixedSuggestedOrders(queryParams),
      onSuccess: _handleSuggestedOrdersSuccessResponse,
    );
  }

  void _handleSuggestedOrdersSuccessResponse(SuggestedOrdersResponse response) {
    pagingController.nextPage();
    pagingController.isLastPage = response.next == null;
    List<SuggestedOrderUiModel> list = response.results
            ?.map((e) => SuggestedOrderUiModel.fromSuggestedOrderResponse(e))
            .toList() ??
        [];

    _suggestedOrdersController(list);
  }

  void _getNextSuggestedOrders() {
    ListQueryParams queryParams = ListQueryParams(
      page: pagingController.pageNumber,
      search: searchController.text,
    );

    callDataService(
      _repository.getFixedSuggestedOrders(queryParams),
      onSuccess: _handleNextSuggestedOrdersSuccessResponse,
      onStart: () => logger.d("Fetching more suggested orders"),
      onComplete: () => refreshController.loadComplete(),
    );
  }

  void _handleNextSuggestedOrdersSuccessResponse(
      SuggestedOrdersResponse response) {
    pagingController.nextPage();
    pagingController.isLastPage = response.next == null;
    List<SuggestedOrderUiModel> list = suggestedOrders;
    list.addAll(response.results
            ?.map((e) => SuggestedOrderUiModel.fromSuggestedOrderResponse(e))
            .toList() ??
        []);
  }

  Future addToCart(String itemId, String quantityString) {
    if (!quantityString.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization
          .messageInvalidItemNumber(appLocalization.homeMenuShoppingCart));

      return Future.value();
    }

    int quantity = quantityString.toInt;

    if (quantity == 0) {
      return Future(() => null);
    }

    AddShoppingCartItemRequestBody requestBody = AddShoppingCartItemRequestBody(
      itemId: itemId,
      quantity: quantity,
    );

    return callDataService(
      _repository.addItemToShoppingCart(
        requestBody,
      ),
      onSuccess: (_) => _handleAddToCartSuccessResponse(requestBody),
    );
  }

  void _handleAddToCartSuccessResponse(AddShoppingCartItemRequestBody data) {
    for (SuggestedOrderUiModel element in suggestedOrders) {
      if (element.itemId == data.itemId) {
        element.updateAvailabilityInCart(true);
        rebuildList();
      }
    }
    showSuccessMessage(appLocalization.messageAddedToShoppingCart);
  }

  void rebuildList() {
    _suggestedOrdersController.refresh();
  }

  void getProductPrice(SuggestedOrderUiModel data) {
    if (data.price == 0.0) {
      callDataService(
        _repository.getSuggestedOrderWithPrice(data.itemId),
        onSuccess: (response) =>
            _handleGetProductPriceSuccessResponse(data, response),
        onStart: () => logger.d("Fetched product price"),
        onComplete: () => logger.d("Product price fetched"),
      );
    }
  }

  void _handleGetProductPriceSuccessResponse(
      SuggestedOrderUiModel data, InventoryResponse response) {
    data.updatePrice(response.product?.priceWithTax);
  }

  void onScanned(String? code) {
    if (code != null) {
      _searchModeController(true);
      searchController.text = code;
      _getSuggestedOrders();
    }
  }
}
