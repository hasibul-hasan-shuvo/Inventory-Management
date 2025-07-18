import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/request/inventory_update_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';

abstract class InventoryRepository {
  Future getAllInventories();

  Future<List<InventoryEntityData>> getInventoryList({
    required InventoryListQueryParams queryParams,
  });

  Future deleteInventoryFromServer(int id);

  Future deleteInventory({required int? id, required String itemId});

  Future<List<InventoryChangesEntityData>> getAllInventoryChanges();

  Future<List<DeletedInventoryEntityData>> getDeletedInventories();

  Future<int> deleteIdFromDeletedInventory(int id);

  Future<InventoryEntityData?> getInventoryByItemId(String itemId);

  Future<InventoryEntityData?> updateInventoryData(
      InventoryUpdateRequestBody request);

  Future<InventoryResponse> updateInventoryDataInServer(
      InventoryUpdateRequestBody request);

  Future<int> deleteInventoryChangesByItemId(String itemId);

  Future<void> deleteAllInventories();

  Future<void> deleteAllInventoryChanges();

  Future<List<GlobalInventoryResponse>> getGlobalInventoryList({
    required String query,
  });

  Future<GlobalInventoryResponse> getGlobalInventory(String id);

  Future<InventoryEntityData?> createInventory(
      CreateInventoryRequestBody requestBody);

  Future<InventoryResponse> createInventoryInServer(
      CreateInventoryRequestBody requestBody);

  Future<InventoryListResponse> getInventoryListFromRemote({
    required InventoryListQueryParams queryParams,
  });

  Future<InventoryEntityData?> replaceInventory({
    required int? oldInventoryId,
    required String oldInventoryItemId,
    required CreateInventoryRequestBody newInventory,
  });
}
