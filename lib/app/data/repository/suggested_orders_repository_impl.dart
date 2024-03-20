import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';
import 'package:dental_inventory/app/data/remote/suggested_orders_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository.dart';
import 'package:get/get.dart';

class SuggestedOrdersRepositoryImpl implements SuggestedOrdersRepository {
  final ShoppingCartRepository _cartRepository = Get.find();
  final SuggestedOrdersRemoteDataSource _remoteDataSource = Get.find();

  @override
  Future<SuggestedOrdersResponse> getSuggestedOrders(int page) {
    return _remoteDataSource.getSuggestedOrders(page);
  }

  @override
  Future<ShoppingCartResponse> addItemToShoppingCart(
      AddShoppingCartItemRequestBody requestBody) {
    return _cartRepository.addItemInShoppingCart(requestBody);
  }

  @override
  Future<bool> addAllItemsInShoppingCart() {
    return _cartRepository.addAllItemsInShoppingCart();
  }
}
