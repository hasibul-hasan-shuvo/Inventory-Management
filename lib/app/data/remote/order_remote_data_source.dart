import 'package:dental_inventory/app/data/model/response/order_items_response.dart';
import 'package:dental_inventory/app/data/model/response/order_list_response.dart';

abstract class OrderRemoteDataSource {
  Future<bool> placeOrder();

  Future<OrderListResponse> getOrders(int page);

  Future<OrderItemsResponse> getOrderItems(int orderId);
}
