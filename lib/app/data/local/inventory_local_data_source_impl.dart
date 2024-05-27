import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/dao/inventory_dao.dart';
import 'package:dental_inventory/app/data/local/inventory_local_data_source.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:get/get.dart';

class InventoryLocalDataSourceImpl implements InventoryLocalDataSource {
  final InventoryDao _dao = InventoryDao(Get.find());
  final PreferenceManager _preferenceManager = Get.find();

  @override
  String getLastSyncTimeStamp() {
    return _preferenceManager
        .getString(PreferenceManager.INVENTORY_LAST_SYNC_TIME_STAMP);
  }

  @override
  void setLastSyncTimeStamp(String lastSyncTimeStamp) {
    _preferenceManager.setString(
      PreferenceManager.INVENTORY_LAST_SYNC_TIME_STAMP,
      lastSyncTimeStamp,
    );
  }

  @override
  Future insertAllInventories(List<InventoryEntityCompanion> inventories) {
    return _dao.insertAllInventories(inventories);
  }

  @override
  Future<List<InventoryEntityData>> getInventories(
      InventoryListQueryParams queryParams) {
    return _dao.getInventories(queryParams);
  }

  @override
  Future<InventoryEntityData?> getInventoryById(int id) {
    return _dao.getInventoryById(id);
  }

  @override
  Future<InventoryEntityData?> getInventoryByItemId(String itemId) {
    return _dao.getInventoryByItemId(itemId);
  }

  @override
  Future<int> updateInventory(int id, InventoryEntityCompanion inventory) {
    return _dao.updateInventory(
      id,
      inventory,
    );
  }

  @override
  Future<int> insertInventoryChanges(
      InventoryChangesEntityCompanion inventoryChanges) {
    return _dao.insertInventoryChanges(inventoryChanges);
  }

  @override
  Future<int> deleteInventoryChangesById(int id) {
    return _dao.deleteInventoryChangesById(id);
  }

  @override
  Future<List<InventoryChangesEntityData>> getAllInventoryChanges() {
    return _dao.getInventoryChanges();
  }

  @override
  Future<int> deleteInventory(int id) {
    return _dao.deleteInventoryById(id);
  }

  @override
  Future<int> addInventoryIdToDeletedInventoryEntity(
      DeletedInventoryEntityCompanion inventory) {
    return _dao.insertInventoryToDeletedInventoryEntity(inventory);
  }

  @override
  Future<List<DeletedInventoryEntityData>> getDeletedInventories() {
    return _dao.getDeletedInventories();
  }

  @override
  Future<int> deleteIdFromDeletedInventory(int id) {
    return _dao.deleteIdFromDeletedInventory(id);
  }
}
