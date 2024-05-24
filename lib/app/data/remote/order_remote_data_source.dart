import 'package:dental_inventory/app/data/model/request/confirm_order_delivery_request_body.dart';
import 'package:dental_inventory/app/data/model/request/order_details_query_params.dart';
import 'package:dental_inventory/app/data/model/request/order_list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/order_items_response.dart';
import 'package:dental_inventory/app/data/model/response/order_list_response.dart';

abstract class OrderRemoteDataSource {
  Future<bool> placeOrder();

  Future<OrderListResponse> getOrders(OrderListQueryParams queryParams);

  Future<OrderItemsResponse> getOrderItems(
      int orderId, OrderDetailsQueryParams queryParams);

  Future<bool> confirmOrderDelivery(
    int orderId,
    ConfirmOrderDeliveryRequestBody requestBody,
  );
}
