import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/entities/deleted_inventory_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_changes_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_entity.dart';
import 'package:drift/drift.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [
  InventoryEntity,
  InventoryChangesEntity,
  DeletedInventoryEntity,
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

  Future<List<InventoryEntityData>> getInventories(
    String? search,
    int offset,
    int pageSize,
  ) {
    List<OrderingTerm Function($InventoryEntityTable)> orders = [
      (tbl) => OrderingTerm(
            expression: inventoryEntity.id,
            mode: OrderingMode.asc,
          ),
    ];

    Expression<bool> condition = inventoryEntity.productName.like('%$search%') |
        inventoryEntity.itemId.contains('%$search%');

    final query = select(inventoryEntity)
      ..where((tbl) => condition)
      ..orderBy(orders)
      ..limit(pageSize, offset: offset);

    return query.get();
  }

  Future<InventoryEntityData?> getInventoryById(int id) {
    final query = select(inventoryEntity)..where((tbl) => tbl.id.equals(id));

    return query.getSingleOrNull();
  }

  Future<InventoryEntityData?> getInventoryByItemId(String itemId) {
    final query = select(inventoryEntity)
      ..where((tbl) => tbl.itemId.equals(itemId));

    return query.getSingleOrNull();
  }

  Future<int> updateInventory(int id, InventoryEntityCompanion inventory) {
    return (update(inventoryEntity)..where((tbl) => tbl.id.equals(id)))
        .write(inventory);
  }

  Future<void> deleteInventories() {
    return batch((batch) => batch.deleteAll(inventoryEntity));
  }

  Future<int> deleteInventoryById(int id) {
    return (delete(inventoryEntity)..where((tbl) => tbl.id.equals(id))).go();
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

  Future<int> insertInventoryToDeletedInventoryEntity(
      DeletedInventoryEntityCompanion inventory) {
    return into(deletedInventoryEntity).insertOnConflictUpdate(inventory);
  }

  Future<List<DeletedInventoryEntityData>> getDeletedInventories() {
    final query = select(deletedInventoryEntity);

    return query.get();
  }

  Future<int> deleteDeletedInventory(int id) {
    return (delete(deletedInventoryEntity)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
