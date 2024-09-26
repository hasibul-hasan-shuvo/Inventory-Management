import 'package:dental_inventory/app/data/model/request/confirm_order_delivery_request_body.dart';
import 'package:dental_inventory/app/data/model/request/list_query_params.dart';
import 'package:dental_inventory/app/data/model/request/order_details_query_params.dart';
import 'package:dental_inventory/app/data/model/response/order_items_response.dart';
import 'package:dental_inventory/app/data/model/response/order_list_response.dart';
import 'package:dental_inventory/app/data/remote/order_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/order_repository.dart';
import 'package:get/get.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remoteDataSource = Get.find();

  @override
  Future<bool> placeOrder({bool removeUnavailableProducts = false}) {
    return _remoteDataSource.placeOrder(
        removeUnavailableProducts: removeUnavailableProducts);
  }

  @override
  Future<OrderListResponse> getOrders(ListQueryParams queryParams) {
    return _remoteDataSource.getOrders(queryParams);
  }

  @override
  Future<OrderItemsResponse> getOrderItems(
      int orderId, OrderDetailsQueryParams queryParams) {
    return _remoteDataSource.getOrderItems(
      orderId,
      queryParams,
    );
  }

  @override
  Future<bool> confirmOrderDelivery(
    int orderId,
    ConfirmOrderDeliveryRequestBody requestBody,
  ) {
    return _remoteDataSource.confirmOrderDelivery(
      orderId,
      requestBody,
    );
  }
}
