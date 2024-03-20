import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dio/dio.dart';

class InventoryRemoteDataSourceImp extends BaseRemoteSource
    implements InventoryRemoteDataSource {
  @override
  Future<InventoryListResponse> getInventoryList(Map<String, dynamic> request) {
    const endpoint = '${EndPoints.inventoryItems}/all/';
    var dioCall = dioClient.get(endpoint);
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
    var dioCall = dioClient.put(endpoint);
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
  Future deleteInventory(Map<String, dynamic> request) {
    final endpoint = '/inventory/items/${request["id"]}/delete/';

    var dioCall = dioClient.delete(endpoint, data: request);
    try {
      return callApiWithErrorParser(dioCall);
    } catch (e) {
      rethrow;
    }
  }
}
