import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/remote/shopping_cart_remote_data_source.dart';
import 'package:dio/dio.dart';

class ShoppingCartRemoteDataSourceImpl extends BaseRemoteSource
    implements ShoppingCartRemoteDataSource {
  @override
  Future<ShoppingCartListResponse> getActiveShoppingCart(int page) {
    try {
      Map<String, dynamic> queryParams = {
        'page': page,
        'page_size': AppValues.defaultPageSize,
      };

      var dioCall = dioClient.get(
        EndPoints.activeShoppingCart,
        queryParameters: queryParams,
      );

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseActiveShoppingCartResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  ShoppingCartListResponse _parseActiveShoppingCartResponse(
      Response<dynamic> response) {
    return ShoppingCartListResponse.fromJson(response.data);
  }
}
