import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';

class ShoppingCartUiModel {
  late final int id;
  late final String name;
  late final String imageUrl;
  late final String itemId;
  late int cartCount;
  late final int count;
  late final num price;
  late final bool isAvailable;
  late final double taxRate;
  late final double priceWithTax;

  ShoppingCartUiModel.fromShoppingCartResponse(ShoppingCartResponse response) {
    id = response.id ?? -1;
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    itemId = response.product?.itemId ?? '';
    count = response.stockCount ?? 0;
    price = response.product?.price ?? 0.0;
    cartCount = response.quantity ?? 0;
    isAvailable = response.product?.isAvailable ?? false;
    taxRate = response.product?.taxRate ?? 0.0;
    priceWithTax = response.product?.priceWithTax ?? 0.0;
  }

  void updateCartCount(int newCount) {
    cartCount = newCount;
  }

  AddShoppingCartItemRequestBody toAddShoppingCartItemRequestBody() {
    return AddShoppingCartItemRequestBody(
      itemId: itemId,
      quantity: cartCount,
    );
  }
}
