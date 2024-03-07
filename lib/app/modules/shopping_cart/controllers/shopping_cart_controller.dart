import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
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
      ShoppingCartUiModel.dummy("12345"),
      ShoppingCartUiModel.dummy("12346"),
      ShoppingCartUiModel.dummy("12347"),
      ShoppingCartUiModel.dummy("12348"),
      ShoppingCartUiModel.dummy("12349"),
      ShoppingCartUiModel.dummy("12340"),
      ShoppingCartUiModel.dummy("12341"),
      ShoppingCartUiModel.dummy("12342"),
      ShoppingCartUiModel.dummy("12343"),
    ]);
  }

  void _getNextSuggestedOrders() {}

  void orderAll() {
    logger.d("Ordering all items");
  }

  void updateCartCount() {
    _shoppingCartItemsController.refresh();
  }

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ShoppingCartUiModel product in shoppingCartItems) {
        if (product.id == code) {
          isListItem = true;
          product.updateCartCount(product.cartCount + 1);
          break;
        }
      }
      if (!isListItem) {
        _shoppingCartItemsController.add(ShoppingCartUiModel.dummy(code!));
      }

      _shoppingCartItemsController.refresh();
    }
  }
}
