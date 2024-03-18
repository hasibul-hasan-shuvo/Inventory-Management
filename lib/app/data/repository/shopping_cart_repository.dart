import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';

abstract class ShoppingCartRepository {
  Future<ShoppingCartListResponse> getActiveShoppingCart(int page);
}
