import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_ui_model.dart';
import 'package:get/get.dart';

mixin ShoppingCartScannedProductsControllerMixin {
  final RxList<ShoppingCartUiModel> _shoppingCartItemsController =
      RxList.empty(growable: true);

  List<ShoppingCartUiModel> get shoppingCartItems =>
      _shoppingCartItemsController;

  Rx<ShoppingCartUiModel?> newCartItemArrivedController = Rx(null);

  void onRefreshProduct() {
    _shoppingCartItemsController.refresh();
  }

  void handleUpdateCartSuccessResponse(ShoppingCartResponse response) {
    ShoppingCartUiModel? data = getUpdateCartItem(response.product?.itemId);

    if (data != null) {
      data.updateCartCount(response.quantity ?? data.cartCount);
      onRefreshProduct();
    }
  }

  ShoppingCartUiModel? getUpdateCartItem(String? itemId) {
    return _shoppingCartItemsController
        .firstWhereOrNull((element) => element.itemId == itemId);
  }

  void handleDeleteCartItemSuccessResponse(int id) {
    removeProductById(id);
  }

  void addProduct(ShoppingCartUiModel data) {
    _shoppingCartItemsController.add(data);
  }

  void addAllProduct(List<ShoppingCartUiModel> listOfData) {
    _shoppingCartItemsController(listOfData);
  }

  void handleConfirmOrderSuccessResponse(bool isSuccess) {
    if (isSuccess) {
      _shoppingCartItemsController.clear();
    }
  }

  void removeProductByItemId(String? itemId) {
    _shoppingCartItemsController
        .removeWhere((element) => itemId == element.itemId);
    onRefreshProduct();
  }

  void removeProductById(int? id) {
    _shoppingCartItemsController.removeWhere((element) => id == element.id);
  }

  void onItemAdded(ShoppingCartResponse response);
}
