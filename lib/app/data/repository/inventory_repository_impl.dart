import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/inventory_local_data_source.dart';
import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/auth_repository.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:get/get.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryRemoteDataSource _remoteDataSource = Get.find();
  final InventoryLocalDataSource _localDataSource = Get.find();

  final AuthRepository _authRepository = Get.find();

  @override
  Future getAllInventories() {
    return _remoteDataSource
        .getInventoryList(queryParams: InventoryListQueryParams())
        .then((response) {
      if (response.inventoryList != null &&
          response.inventoryList?.isNotEmpty == true) {
        List<InventoryEntityCompanion> inventories = response.inventoryList!
            .map((e) => e.toInventoryEntityCompanion())
            .toList();

        return _localDataSource.insertAllInventories(inventories);
      }
    });
  }

  @override
  Future<List<InventoryEntityData>> getInventoryList({
    required InventoryListQueryParams queryParams,
  }) {
    return _localDataSource.getInventories(queryParams);
  }

  @override
  Future<InventoryResponse> updateInventoryData(
      InventoryCountUpdateRequest request) {
    return _remoteDataSource.updateInventoryData(request);
  }

  @override
  Future<InventoryResponse> getProduct(String itemId) {
    return _remoteDataSource.getProduct(itemId);
  }

  @override
  Future<ProductRetrievalResponse> retrieveProduct(
      ProductsRetrievalRequestBody requestBody) {
    String inventoryId = _authRepository.getInventoryID();

    return _remoteDataSource.retrieveProduct(
      inventoryId,
      requestBody,
    );
  }

  @override
  Future deleteInventory({required String id}) {
    return _remoteDataSource.deleteInventory(id: id);
  }

  @override
  Future<List<GlobalInventoryResponse>> getGlobalInventoryList(
      {required String query}) {
    return _remoteDataSource.getGlobalInventoryList(query);
  }

  @override
  Future<GlobalInventoryResponse> getGlobalInventory(String id) {
    return _remoteDataSource.getGlobalInventory(id);
  }

  @override
  Future<InventoryResponse> createInventory(
      CreateInventoryRequestBody requestBody) {
    return _remoteDataSource.createInventory(requestBody);
  }
}
