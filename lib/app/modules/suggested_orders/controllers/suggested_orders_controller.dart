import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository.dart';
import 'package:dental_inventory/app/modules/suggested_orders/models/suggested_order_ui_model.dart';
import 'package:get/get.dart';

class SuggestedOrdersController extends BaseController {
  final SuggestedOrdersRepository _repository = Get.find();
  final RxList<SuggestedOrderUiModel> _suggestedOrdersController =
      RxList.empty(growable: true);

  List<SuggestedOrderUiModel> get suggestedOrders => _suggestedOrdersController;

  final List<SuggestedOrderUiModel> _exemptedItems = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    pagingController.initRefresh();
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

  void onLoading() {
    if (pagingController.canLoadNextPage()) {
      _getNextSuggestedOrders();
    }
  }

  void _getSuggestedOrders() {
    callDataService(
      _repository.getSuggestedOrders(
        pagingController.pageNumber,
      ),
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
    callDataService(
      _repository.getSuggestedOrders(
        pagingController.pageNumber,
      ),
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

  Future addToCart(SuggestedOrderUiModel item, String quantityString) {
    if (!quantityString.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization
          .messageInvalidItemNumber(appLocalization.homeMenuShoppingCart));

      return Future.value();
    }

    int quantity = quantityString.toInt;

    if (quantity < 1) {
      return removeItemTemporarily(item);
    }

    AddShoppingCartItemRequestBody requestBody = AddShoppingCartItemRequestBody(
      itemId: item.itemId,
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
    SuggestedOrderUiModel? addedItem =
        _suggestedOrdersController.firstWhereOrNull(
      (element) => element.itemId == data.itemId,
    );
    if (addedItem != null) {
      removeItemTemporarily(
        addedItem,
        showRemovedMessage: false,
      );
    }
    showSuccessMessage(appLocalization.messageAddedToShoppingCart);
  }

  Future<bool> removeItemTemporarily(
    SuggestedOrderUiModel item, {
    bool showRemovedMessage = true,
  }) {
    _suggestedOrdersController.remove(item);
    _exemptedItems.add(item);

    if (showRemovedMessage) {
      showMessage(appLocalization.messageItemRemovedTemporarily);
    }

    return Future.value(true);
  }

  void addToCartAll() {
    if (suggestedOrders.isNotEmpty) {
      List<String> exemptedIds = _exemptedItems.map((e) => e.itemId).toList();

      callDataService(
        _repository.addAllItemsInShoppingCart(exemptedIds),
        onSuccess: _handleAddToCartAllSuccessResponse,
      );
    }
  }

  void _handleAddToCartAllSuccessResponse(bool isSuccess) {
    if (isSuccess) {
      _suggestedOrdersController.clear();
      _exemptedItems.clear();
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
}
