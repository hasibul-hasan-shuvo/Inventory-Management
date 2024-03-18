import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';

class ShoppingCartUiModel {
  late final String id;
  late final String name;
  late final String imageUrl;
  late final String itemId;
  late final int min;
  late final int max;
  late final int? fixedSuggestion;
  late int cartCount;
  late final int count;
  late final num price;

  ShoppingCartUiModel.fromShoppingCartResponse(ShoppingCartResponse response) {
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    itemId = response.product?.itemId ?? '';
    min = 10;
    max = 100;
    fixedSuggestion = 20;
    count = 5;
    price = 100;
    cartCount = 95;
  }

  void updateCartCount(int newCount) {
    cartCount = newCount;
  }
}
