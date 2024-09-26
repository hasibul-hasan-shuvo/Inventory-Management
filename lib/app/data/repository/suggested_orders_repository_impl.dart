import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/request/list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_data_source.dart';
import 'package:dental_inventory/app/data/remote/suggested_orders_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository.dart';
import 'package:get/get.dart';

class SuggestedOrdersRepositoryImpl implements SuggestedOrdersRepository {
  final ShoppingCartRepository _cartRepository = Get.find();
  final SuggestedOrdersRemoteDataSource _suggestedOrdersRemoteDataSource =
      Get.find();
  final InventoryRemoteDataSource _inventoryRemoteDataSource = Get.find();

  @override
  Future<SuggestedOrdersResponse> getSuggestedOrders(int page) {
    return _suggestedOrdersRemoteDataSource.getSuggestedOrders(page);
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

  @override
  Future<InventoryResponse> getSuggestedOrderWithPrice(String itemId) {
    return _inventoryRemoteDataSource.getProduct(itemId);
  }

  @override
  Future<SuggestedOrdersResponse> getFixedSuggestedOrders(
      ListQueryParams queryParams) {
    return _suggestedOrdersRemoteDataSource
        .getFixedSuggestedOrders(queryParams);
  }
}
