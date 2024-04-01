import 'dart:io';

import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
import 'package:dental_inventory/app/data/model/response/order_items_response.dart';
import 'package:dental_inventory/app/data/model/response/order_list_response.dart';
import 'package:dental_inventory/app/data/remote/order_remote_data_source.dart';
import 'package:dio/dio.dart';

class OrderRemoteDataSourceImpl extends BaseRemoteSource
    implements OrderRemoteDataSource {
  @override
  Future<bool> placeOrder() {
    try {
      var dioCall = dioClient.put(
        EndPoints.placeOrder,
      );

      return callApiWithErrorParser(dioCall)
          .then((response) => _parsePlaceOrderResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  bool _parsePlaceOrderResponse(Response<dynamic> response) {
    return response.statusCode == HttpStatus.ok;
  }

  @override
  Future<OrderListResponse> getOrders(int page) {
    try {
      final queryParams = {
        'page': page,
        'page_size': AppValues.defaultPageSize,
      };

      var dioCall = dioClient.get(
        '${EndPoints.orders}/list/',
        queryParameters: queryParams,
      );

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseOrdersResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  OrderListResponse _parseOrdersResponse(Response<dynamic> response) {
    return OrderListResponse.fromJson(response.data);
  }

  @override
  Future<OrderItemsResponse> getOrderItems(int orderId) {
    try {
      var dioCall = dioClient.get(
        '${EndPoints.orders}/$orderId/',
      );

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseOrderItemsResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  OrderItemsResponse _parseOrderItemsResponse(Response<dynamic> response) {
    return OrderItemsResponse.fromJson(response.data);
  }
}
