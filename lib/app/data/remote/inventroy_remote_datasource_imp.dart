import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dio/dio.dart';

class InventoryRemoteDataSourceImp extends BaseRemoteSource
    implements InventoryRemoteDataSource {
  @override
  Future<InventoryListResponse> getInventoryList() {
    const endpoint = '/inventory/items/all/';
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseInventoryResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  InventoryListResponse _parseInventoryResponse(Response response) {
    return InventoryListResponse.fromJson(response.data);
  }

  @override
  Future<InventoryListResponse> updateInventoryData(
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
}
