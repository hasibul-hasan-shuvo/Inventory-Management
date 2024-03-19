import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';

abstract class ShoppingCartRemoteDataSource {
  Future<ShoppingCartListResponse> getActiveShoppingCart(int page);

  Future<ShoppingCartResponse> addItemInShoppingCart(
      AddShoppingCartItemRequestBody requestBody);
}
