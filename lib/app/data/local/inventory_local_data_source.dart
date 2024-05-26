import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';

abstract class InventoryLocalDataSource {
  String getLastSyncTimeStamp();

  void setLastSyncTimeStamp(String lastSyncTimeStamp);

  Future insertAllInventories(List<InventoryEntityCompanion> inventories);

  Future<List<InventoryEntityData>> getInventories(
      InventoryListQueryParams queryParams);

  Future<InventoryEntityData?> getInventoryById(int id);

  Future<InventoryEntityData?> getInventoryByItemId(String itemId);

  Future<int> updateInventory(
    int id,
    InventoryEntityCompanion inventory,
  );

  Future<int> insertInventoryChanges(
      InventoryChangesEntityCompanion inventoryChanges);

  Future<int> deleteInventoryChangesById(int id);

  Future<List<InventoryChangesEntityData>> getAllInventoryChanges();

  Future<int> deleteInventory(int id);

  Future<int> addInventoryIdToDeletedInventoryEntity(
      DeletedInventoryEntityCompanion inventory);

  Future<List<DeletedInventoryEntityData>> getDeletedInventories();

  Future<int> deleteIdFromDeletedInventory(int id);
}
