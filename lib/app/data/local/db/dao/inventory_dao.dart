import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_entity.dart';
import 'package:drift/drift.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [
  InventoryEntity,
])
class InventoryDao extends DatabaseAccessor<AppDatabase>
    with _$InventoryDaoMixin {
  InventoryDao(super.attachedDatabase);

  Future<int> insertInventory(InventoryEntityCompanion inventory) {
    return into(inventoryEntity).insertOnConflictUpdate(inventory);
  }

  Future<void> insertAllInventories(
      List<InventoryEntityCompanion> inventories) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(inventoryEntity, inventories);
    });
  }

  Future<void> deleteInventories() {
    return batch((batch) => batch.deleteAll(inventoryEntity));
  }
}
