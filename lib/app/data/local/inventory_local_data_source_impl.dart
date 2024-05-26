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
  Future<int> updateInventory(int id, InventoryEntityCompanion inventory) {
    return _inventoryDao.updateInventory(
      id,
      inventory,
    );
  }
}
