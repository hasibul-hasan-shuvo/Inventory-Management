import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_ui_model.dart';
import 'package:get/get.dart';

class ShoppingCartController extends BaseController {
  final RxList<ShoppingCartUiModel> _shoppingCartItemsController =
      RxList.empty(growable: true);
  List<ShoppingCartUiModel> get shoppingCartItems =>
      _shoppingCartItemsController;

  @override
  void onInit() {
    super.onInit();
    _getSuggestedOrders();
  }

  void onLoading() {
    _getNextSuggestedOrders();
  }

  void _getSuggestedOrders() {
    _shoppingCartItemsController([
      ShoppingCartUiModel.dummy(),
      ShoppingCartUiModel.dummy(),
      ShoppingCartUiModel.dummy(),
      ShoppingCartUiModel.dummy(),
      ShoppingCartUiModel.dummy(),
      ShoppingCartUiModel.dummy(),
      ShoppingCartUiModel.dummy(),
      ShoppingCartUiModel.dummy(),
      ShoppingCartUiModel.dummy(),
    ]);
  }

  void _getNextSuggestedOrders() {}

  void orderAll() {
    logger.d("Ordering all items");
  }

  void rebuildList() {
    _shoppingCartItemsController.refresh();
  }
}
