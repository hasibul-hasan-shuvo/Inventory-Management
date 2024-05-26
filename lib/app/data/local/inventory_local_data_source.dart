import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';

abstract class InventoryLocalDataSource {
  Future insertAllInventories(List<InventoryEntityCompanion> inventories);

  Future<List<InventoryEntityData>> getInventories(
      InventoryListQueryParams queryParams);

  Future<InventoryEntityData?> getInventoryById(int id);

  Future<InventoryEntityData?> getInventoryByItemId(String itemId);

  Future<int> updateInventory(
    int id,
    InventoryEntityCompanion inventory,
  );

  Future<int> deleteInventory(int id);

  Future<int> addInventoryIdToDeletedInventoryEntity(
      DeletedInventoryEntityCompanion inventory);

  Future<List<DeletedInventoryEntityData>> getDeletedInventories();

  Future<int> deleteIdFromDeletedInventory(int id);
}
