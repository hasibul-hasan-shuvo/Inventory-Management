import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/remote/shopping_cart_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/order_repository.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository.dart';
import 'package:get/get.dart';

class ShoppingCartRepositoryImpl implements ShoppingCartRepository {
  final ShoppingCartRemoteDataSource _remoteDataSource = Get.find();
  final OrderRepository _orderRepository = Get.find();

  @override
  Future<ShoppingCartListResponse> getActiveShoppingCart(int page) {
    return _remoteDataSource.getActiveShoppingCart(page);
  }

  @override
  Future<ShoppingCartResponse> addItemInShoppingCart(
      AddShoppingCartItemRequestBody requestBody) {
    return _remoteDataSource.addItemInShoppingCart(requestBody);
  }

  @override
  Future<ShoppingCartResponse> updateItemInShoppingCart(
      String id, AddShoppingCartItemRequestBody requestBody) {
    return _remoteDataSource.updateItemInShoppingCart(id, requestBody);
  }

  @override
  Future<bool> deleteItemFromShoppingCart(String id) {
    return _remoteDataSource.deleteItemFromShoppingCart(id);
  }

  @override
  Future<bool> addAllItemsInShoppingCart() {
    return _remoteDataSource.addAllItemsInShoppingCart();
  }

  @override
  Future<bool> placeOrder() {
    return _orderRepository.placeOrder();
  }
}
