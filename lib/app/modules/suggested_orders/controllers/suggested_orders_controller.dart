import 'package:dental_inventory/app/core/base/base_controller.dart';
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

  Future addToCart(SuggestedOrderUiModel data) {
    return callDataService(
      _repository.addItemToShoppingCart(
        data.toAddShoppingCartItemRequestBody(),
      ),
      onSuccess: (_) => _handleAddToCartSuccessResponse(data),
    );
  }

  void _handleAddToCartSuccessResponse(SuggestedOrderUiModel data) {
    _suggestedOrdersController.removeWhere(
      (element) => element.id == data.id,
    );
  }

  void addToCartAll() {
    logger.d("Adding all items to shopping cart");
    _suggestedOrdersController.clear();
  }

  void rebuildList() {
    _suggestedOrdersController.refresh();
  }
}
