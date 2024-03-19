import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';

abstract class SuggestedOrdersRepository {
  Future<SuggestedOrdersResponse> getSuggestedOrders(int page);

  Future<ShoppingCartResponse> addItemToShoppingCart(
      AddShoppingCartItemRequestBody requestBody);
}
