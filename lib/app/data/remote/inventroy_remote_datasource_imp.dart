import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/data/model/inventory_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dio/dio.dart';

class InventoryRemoteDataSourceImp extends BaseRemoteSource
    implements InventoryRemoteDataSource {
  @override
  Future<InventoryResponse> getInventoryList() {
    const endpoint = '/inventory/items/all/';
    var dioCall = dioClient.get(endpoint);
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
}
