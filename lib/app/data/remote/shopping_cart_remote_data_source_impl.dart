import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/product_price_response.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_total_price_response.dart';
import 'package:dental_inventory/app/data/remote/shopping_cart_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

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

  @override
  Future<ShoppingCartResponse> addItemInShoppingCart(
      AddShoppingCartItemRequestBody requestBody) {
    try {
      var dioCall = dioClient.post(
        EndPoints.addShoppingCartItems,
        data: requestBody.toJson(),
      );

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseShoppingCartResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  ShoppingCartResponse _parseShoppingCartResponse(Response<dynamic> response) {
    return ShoppingCartResponse.fromJson(response.data);
  }

  @override
  Future<ShoppingCartResponse> updateItemInShoppingCart(
      String id, AddShoppingCartItemRequestBody requestBody) {
    try {
      String endpoint = "${EndPoints.activeShoppingCart}/$id/update/";
      var dioCall = dioClient.put(
        endpoint,
        data: requestBody.toJson(),
      );

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseShoppingCartResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteItemFromShoppingCart(String id) {
    try {
      String endpoint = "${EndPoints.activeShoppingCart}/$id/delete/";
      var dioCall = dioClient.delete(endpoint);

      return callApiWithErrorParser(dioCall).then(
          (response) => _parseDeleteItemFromShoppingCartResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  bool _parseDeleteItemFromShoppingCartResponse(Response<dynamic> response) {
    return response.statusCode == HttpStatus.noContent;
  }

  @override
  Future<bool> addAllItemsInShoppingCart(List<String> exemptedIds) {
    try {
      String endpoint =
          "${EndPoints.addShoppingCartItems}/all/?exempted_product_ids=$exemptedIds";

      var dioCall = dioClient.post(
        endpoint,
      );

      return callApiWithErrorParser(dioCall).then(
          (response) => _handleAddAllItemsInShoppingCartResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  bool _handleAddAllItemsInShoppingCartResponse(Response<dynamic> response) {
    return response.statusCode == HttpStatus.created;
  }

  @override
  Future<ShoppingCartTotalPriceResponse> getTotalPrice() {
    try {
      var dioCall = dioClient.get(EndPoints.shoppingCartTotalPrice);

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseTotalPriceResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  ShoppingCartTotalPriceResponse _parseTotalPriceResponse(
      Response<dynamic> response) {
    return ShoppingCartTotalPriceResponse.fromJson(response.data);
  }

  @override
  Future<ProductPriceResponse> getProductPrice(String itemId) {
    try {
      String endpoint = '${EndPoints.getProductPrice}/$itemId';
      var dioCall = dioClient.get(endpoint);

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseProductPriceResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  ProductPriceResponse _parseProductPriceResponse(Response<dynamic> response) {
    return ProductPriceResponse.fromJson(response.data);
  }
}
