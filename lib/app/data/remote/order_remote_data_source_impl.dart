import 'dart:io';

import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
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
}
