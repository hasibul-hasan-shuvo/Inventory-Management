import 'dart:core';

import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_data_source.dart';
import 'package:dio/dio.dart';

class InventoryRemoteDataSourceImpl extends BaseRemoteSource
    implements InventoryRemoteDataSource {
  @override
  Future<InventoryListResponse> getInventoryList({
    required String searchQuery,
  }) {
    const endpoint = '${EndPoints.inventoryItems}/all/';
    var dioCall = dioClient.get(
      endpoint,
      queryParameters: {
        "search": searchQuery,
      },
    );
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseInventoryListResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  InventoryListResponse _parseInventoryListResponse(Response response) {
    return InventoryListResponse.fromJson(response.data);
  }

  @override
  Future<InventoryResponse> updateInventoryData(
      InventoryCountUpdateRequest request) {
    final endpoint = '/inventory/items/${request.productID}/update/';

    var dioCall = dioClient.put(endpoint, data: request.toJson());
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseInventoryResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  InventoryResponse _parseInventoryResponse(Response response) {
    return InventoryResponse.fromJson(response.data);
  }

  @override
  Future<InventoryResponse> getProduct(String itemId) {
    String endpoint = '${EndPoints.inventoryItems}/$itemId/';
    var dioCall = dioClient.get(endpoint, queryParameters: {"id": itemId});
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseInventoryResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductRetrievalResponse> retrieveProduct(
      String inventoryId, ProductsRetrievalRequestBody requestBody) {
    String endpoint = '${EndPoints.inventory}/$inventoryId/items/bulk-update/';
    var dioCall = dioClient.put(
      endpoint,
      data: requestBody.toJson(),
    );
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseProductRetrievalResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  ProductRetrievalResponse _parseProductRetrievalResponse(
      Response<dynamic> response) {
    return ProductRetrievalResponse.fromJson(response.data);
  }

  @override
  Future deleteInventory({required String id}) {
    final endpoint = '/inventory/items/$id/delete/';
    var dioCall = dioClient.delete(endpoint);
    try {
      return callApiWithErrorParser(dioCall);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<GlobalInventoryResponse>> getGlobalInventoryList(String query) {
    try {
      String endpoint = '${EndPoints.globalInventory}/$query/';
      var dioCall = dioClient.get(endpoint);

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseGlobalInventoryList(response));
    } catch (e) {
      rethrow;
    }
  }

  List<GlobalInventoryResponse> _parseGlobalInventoryList(
      Response<dynamic> response) {
    List<GlobalInventoryResponse> list = List.empty(growable: true);

    if (response.data is List) {
      response.data
          .forEach((json) => list.add(GlobalInventoryResponse.fromJson(json)));
    } else {
      list.add(GlobalInventoryResponse.fromJson(response.data));
    }

    return list;
  }
}
