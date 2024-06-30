import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_total_price_response.dart';

abstract class ShoppingCartRepository {
  Future<ShoppingCartListResponse> getActiveShoppingCart(int page);

  Future<ShoppingCartResponse> addItemInShoppingCart(
      AddShoppingCartItemRequestBody requestBody);

  Future<ShoppingCartResponse> updateItemInShoppingCart(
      String id, AddShoppingCartItemRequestBody requestBody);

  Future<bool> deleteItemFromShoppingCart(String id);

  Future<bool> addAllItemsInShoppingCart();

  Future<bool> placeOrder();

  Future<ShoppingCartTotalPriceResponse> getTotalPrice();
}
