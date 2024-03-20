import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dio/dio.dart';

class InventoryRemoteDataSourceImp extends BaseRemoteSource
    implements InventoryRemoteDataSource {
  @override
  Future<InventoryListResponse> getInventoryList() {
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
    print(request.productID);

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
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseInventoryResponse(response));
    } catch (e) {
      rethrow;
    }
  }
}
