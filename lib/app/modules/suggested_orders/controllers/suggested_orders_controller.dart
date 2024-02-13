import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/modules/suggested_orders/models/suggested_order_ui_model.dart';
import 'package:get/get.dart';

class SuggestedOrdersController extends BaseController {
  final RxList<SuggestedOrderUiModel> _suggestedOrdersController =
      RxList.empty(growable: true);
  List<SuggestedOrderUiModel> get suggestedOrders => _suggestedOrdersController;

  @override
  void onInit() {
    super.onInit();
    _getSuggestedOrders();
  }

  void onLoading() {
    _getNextSuggestedOrders();
  }

  void _getSuggestedOrders() {
    _suggestedOrdersController([
      SuggestedOrderUiModel.dummy(),
      SuggestedOrderUiModel.dummy(),
      SuggestedOrderUiModel.dummy(),
      SuggestedOrderUiModel.dummy(),
      SuggestedOrderUiModel.dummy(),
      SuggestedOrderUiModel.dummy(),
      SuggestedOrderUiModel.dummy(),
      SuggestedOrderUiModel.dummy(),
      SuggestedOrderUiModel.dummy(),
    ]);
  }

  void _getNextSuggestedOrders() {}

  void addToCart(SuggestedOrderUiModel data) {
    logger.d("Adding to shopping cart: ${data.name}");
  }

  void addToCartAll() {
    logger.d("Adding all items to shopping cart");
  }

  void rebuildList() {
    _suggestedOrdersController.refresh();
  }
}
