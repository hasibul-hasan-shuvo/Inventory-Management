import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/dao/inventory_dao.dart';
import 'package:dental_inventory/app/data/local/inventory_local_data_source.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:get/get.dart';

class InventoryLocalDataSourceImpl implements InventoryLocalDataSource {
  final InventoryDao _inventoryDao = InventoryDao(Get.find());

  @override
  Future insertAllInventories(List<InventoryEntityCompanion> inventories) {
    return _inventoryDao.insertAllInventories(inventories);
  }

  @override
  Future<List<InventoryEntityData>> getInventories(
      InventoryListQueryParams queryParams) {
    int offset = (queryParams.page - 1) * queryParams.pageSize;

    return _inventoryDao.getInventories(
      queryParams.search,
      offset,
      queryParams.pageSize,
    );
  }

  @override
  Future<InventoryEntityData?> getInventoryById(int id) {
    return _inventoryDao.getInventoryById(id);
  }

  @override
  Future<InventoryEntityData?> getInventoryByItemId(String itemId) {
    return _inventoryDao.getInventoryByItemId(itemId);
  }

  @override
  Future<int> updateInventory(int id, InventoryEntityCompanion inventory) {
    return _inventoryDao.updateInventory(
      id,
      inventory,
    );
  }

  @override
  Future<int> deleteInventory(int id) {
    return _inventoryDao.deleteInventoryById(id);
  }

  @override
  Future<int> addInventoryIdToDeletedInventoryEntity(
      DeletedInventoryEntityCompanion inventory) {
    return _inventoryDao.insertInventoryToDeletedInventoryEntity(inventory);
  }

  @override
  Future<List<DeletedInventoryEntityData>> getDeletedInventories() {
    return _inventoryDao.getDeletedInventories();
  }

  @override
  Future<int> deleteIdFromDeletedInventory(int id) {
    return _inventoryDao.deleteIdFromDeletedInventory(id);
  }
}
