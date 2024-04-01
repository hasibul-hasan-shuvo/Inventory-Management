import 'package:dental_inventory/app/data/model/request/order_list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/order_items_response.dart';
import 'package:dental_inventory/app/data/model/response/order_list_response.dart';
import 'package:dental_inventory/app/data/remote/order_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/order_repository.dart';
import 'package:get/get.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remoteDataSource = Get.find();

  @override
  Future<bool> placeOrder() {
    return _remoteDataSource.placeOrder();
  }

  @override
  Future<OrderListResponse> getOrders(OrderListQueryParams queryParams) {
    return _remoteDataSource.getOrders(queryParams);
  }

  @override
  Future<OrderItemsResponse> getOrderItems(int orderId) {
    return _remoteDataSource.getOrderItems(orderId);
  }
}
