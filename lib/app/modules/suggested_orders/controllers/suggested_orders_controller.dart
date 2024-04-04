import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository.dart';
import 'package:dental_inventory/app/modules/suggested_orders/models/suggested_order_ui_model.dart';
import 'package:get/get.dart';

class SuggestedOrdersController extends BaseController {
  final SuggestedOrdersRepository _repository = Get.find();
  final RxList<SuggestedOrderUiModel> _suggestedOrdersController =
      RxList.empty(growable: true);

  List<SuggestedOrderUiModel> get suggestedOrders => _suggestedOrdersController;

  @override
  void onInit() {
    super.onInit();
    pagingController.initRefresh();
    _getSuggestedOrders();
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

  Future addToCart(String itemId, int quantity) {
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
    _suggestedOrdersController.removeWhere(
      (element) => element.itemId == data.itemId,
    );
    showSuccessMessage(appLocalization.messageAddedToShoppingCart);
  }

  void addToCartAll() {
    callDataService(
      _repository.addAllItemsInShoppingCart(),
      onSuccess: _handleAddToCartAllSuccessResponse,
    );
  }

  void _handleAddToCartAllSuccessResponse(bool isSuccess) {
    if (isSuccess) {
      _suggestedOrdersController.clear();
    }
    showSuccessMessage(appLocalization.messageAddedToShoppingCart);
  }

  void rebuildList() {
    _suggestedOrdersController.refresh();
  }
}
