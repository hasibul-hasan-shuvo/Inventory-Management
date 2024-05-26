import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';

abstract class InventoryLocalDataSource {
  Future insertAllInventories(List<InventoryEntityCompanion> inventories);

  Future<List<InventoryEntityData>> getInventories(
      InventoryListQueryParams queryParams);

  Future<int> updateInventory(
    int id,
    InventoryEntityCompanion inventory,
  );
}
