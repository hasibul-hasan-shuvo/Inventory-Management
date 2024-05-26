import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_changes_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_entity.dart';
import 'package:drift/drift.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [
  InventoryEntity,
  InventoryChangesEntity,
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

  Future<List<InventoryEntityData>> getInventories(int offset, int pageSize) {
    List<OrderingTerm Function($InventoryEntityTable)> orders = [
      (tbl) => OrderingTerm(
            expression: inventoryEntity.id,
            mode: OrderingMode.asc,
          ),
    ];

    final query = select(inventoryEntity)
      ..orderBy(orders)
      ..limit(pageSize, offset: offset);

    return query.get();
  }

  Future<List<InventoryEntityData>> getInventoryByItemId(String itemId) {
    final query = select(inventoryEntity)
      ..where((tbl) => tbl.itemId.equals(itemId));

    return query.get();
  }

  Future<int> updateInventory(int id, InventoryEntityCompanion inventory) {
    return (update(inventoryEntity)..where((tbl) => tbl.id.equals(id)))
        .write(inventory);
  }

  Future<void> deleteInventories() {
    return batch((batch) => batch.deleteAll(inventoryEntity));
  }

  Future<int> insertInventoryChange(
      InventoryChangesEntityCompanion inventoryChange) {
    return into(inventoryChangesEntity).insertOnConflictUpdate(inventoryChange);
  }

  Future<void> insertAllInventoryChanges(
      List<InventoryChangesEntityCompanion> inventoryChanges) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(inventoryChangesEntity, inventoryChanges);
    });
  }

  Future<List<InventoryChangesEntityData>> getInventoryChanges() {
    final query = select(inventoryChangesEntity);

    return query.get();
  }

  Future<void> deleteInventoryChangeById(int id) {
    return (delete(inventoryChangesEntity)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<void> deleteInventoryChanges() {
    return batch((batch) => batch.deleteAll(inventoryChangesEntity));
  }
}
