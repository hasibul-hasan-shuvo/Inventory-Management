import 'dart:io';

import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
import 'package:dental_inventory/app/data/model/request/confirm_order_delivery_request_body.dart';
import 'package:dental_inventory/app/data/model/request/order_details_query_params.dart';
import 'package:dental_inventory/app/data/model/request/order_list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/order_items_response.dart';
import 'package:dental_inventory/app/data/model/response/order_list_response.dart';
import 'package:dental_inventory/app/data/remote/order_remote_data_source.dart';
import 'package:dio/dio.dart';

class OrderRemoteDataSourceImpl extends BaseRemoteSource
    implements OrderRemoteDataSource {
  @override
  Future<bool> placeOrder({bool removeUnavailableProducts = false}) {
    try {
      String endpoint = EndPoints.placeOrder;

      if (removeUnavailableProducts) {
        endpoint = "$endpoint?remove_unavailable_products";
      }

      var dioCall = dioClient.put(
        endpoint,
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
  Future<OrderListResponse> getOrders(OrderListQueryParams queryParams) {
    try {
      var dioCall = dioClient.get(
        '${EndPoints.orders}/list/',
        queryParameters: queryParams.toJson(),
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
  Future<OrderItemsResponse> getOrderItems(
    int orderId,
    OrderDetailsQueryParams queryParams,
  ) {
    try {
      var dioCall = dioClient.get(
        '${EndPoints.orders}/$orderId/',
        queryParameters: queryParams.toJson(),
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

  @override
  Future<bool> confirmOrderDelivery(
    int orderId,
    ConfirmOrderDeliveryRequestBody requestBody,
  ) {
    try {
      var dioCall = dioClient.put(
        '${EndPoints.orders}/$orderId/update-status/',
        data: requestBody.toJson(),
      );

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseConfirmOrderDeliveryResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  bool _parseConfirmOrderDeliveryResponse(Response<dynamic> response) {
    return response.statusCode == HttpStatus.ok;
  }
}
