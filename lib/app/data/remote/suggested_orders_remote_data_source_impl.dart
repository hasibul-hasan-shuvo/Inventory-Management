import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
import 'package:dental_inventory/app/data/model/request/list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';
import 'package:dental_inventory/app/data/remote/suggested_orders_remote_data_source.dart';
import 'package:dio/dio.dart';

class SuggestedOrdersRemoteDataSourceImpl extends BaseRemoteSource
    implements SuggestedOrdersRemoteDataSource {
  @override
  Future<SuggestedOrdersResponse> getSuggestedOrders(int page) {
    try {
      Map<String, dynamic> queryParams = {
        'page': page,
        'page_size': AppValues.defaultPageSize,
      };

      var dioCall = dioClient.get(
        EndPoints.suggestedOrders,
        queryParameters: queryParams,
      );

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseSuggestedOrdersResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  SuggestedOrdersResponse _parseSuggestedOrdersResponse(
      Response<dynamic> response) {
    return SuggestedOrdersResponse.fromJson(response.data);
  }

  @override
  Future<SuggestedOrdersResponse> getFixedSuggestedOrders(
      ListQueryParams queryParams) {
    try {
      var dioCall = dioClient.get(
        EndPoints.fixedSuggestedOrders,
        queryParameters: queryParams.toJson(),
      );

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseSuggestedOrdersResponse(response));
    } catch (e) {
      rethrow;
    }
  }
}
