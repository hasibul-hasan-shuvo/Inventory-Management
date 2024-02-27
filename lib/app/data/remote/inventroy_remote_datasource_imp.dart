import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/data/model/inventory_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dio/dio.dart';

class InventoryRemoteDataSourceImp extends BaseRemoteSource
    implements InventoryRemoteDataSource {
  Map<String, String> headers ={
    'InventoryID': '2',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA4NzAwOTY3LCJpYXQiOjE3MDg2ODk0MzQsImp0aSI6ImM2Zjg2OTBkYzgxOTQ2N2Q4MTgwZWJmYzkxNGM5MWZhIiwidXNlcl9pZCI6MX0.fH_fjscr_-M7JBuo32nTWJaS_2ebkqzI1-W8gI9HqC0',
  };

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
