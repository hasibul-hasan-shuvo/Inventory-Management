import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/entities/deleted_inventory_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_changes_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_entity.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/network/exceptions/duplicate_unique_field_exception.dart';
import 'package:dental_inventory/flavors/build_config.dart';
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

  Future<int> insertInventory(InventoryEntityCompanion inventory) async {
    try {
      int id = await into(inventoryEntity).insert(
        inventory,
        mode: InsertMode.insertOrAbort,
      );

      return id;
    } catch (e) {
      BuildConfig.instance.config.logger.e("InsertInventoryException: $e");
      throw DuplicateUniqueFieldException();
    }
  }

  Future<void> insertAllInventories(
      List<InventoryEntityCompanion> inventories) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(inventoryEntity, inventories);
    });
  }

  Future<List<InventoryEntityData>> getInventories(
      InventoryListQueryParams queryParams) {
    int offset = (queryParams.page - 1) * queryParams.pageSize;

    List<OrderingTerm Function($InventoryEntityTable)> orders = [
      (tbl) => OrderingTerm(
            expression: inventoryEntity.productName,
            mode: OrderingMode.asc,
          ),
    ];

    Expression<bool> condition =
        (inventoryEntity.productName.like('%${queryParams.search}%') |
                inventoryEntity.itemId.contains('%${queryParams.search}%')) &
            inventoryEntity.stockCount
                .isBiggerOrEqualValue(queryParams.minAvailableQuantity ?? 0);

    final query = select(inventoryEntity)
      ..where((tbl) => condition)
      ..orderBy(orders)
      ..limit(queryParams.pageSize, offset: offset);

    return query.get();
  }

  Future<InventoryEntityData?> getInventoryByItemId(String itemId) {
    final query = select(inventoryEntity)
      ..where((tbl) => tbl.itemId.equals(itemId));

    return query.getSingleOrNull();
  }

  Future<int> updateInventory(
      String itemId, InventoryEntityCompanion inventory) {
    return (update(inventoryEntity)..where((tbl) => tbl.itemId.equals(itemId)))
        .write(inventory);
  }

  Future<void> deleteInventories() {
    return batch((batch) => batch.deleteAll(inventoryEntity));
  }

  Future<int> deleteInventoryByItemId(String itemId) {
    return (delete(inventoryEntity)..where((tbl) => tbl.itemId.equals(itemId)))
        .go();
  }

  Future<int> insertInventoryChanges(
      InventoryChangesEntityCompanion inventoryChanges) {
    return into(inventoryChangesEntity).insert(
      inventoryChanges,
      onConflict: DoUpdate(
        (old) => InventoryChangesEntityCompanion.custom(
          minCount: inventoryChanges.minCount.present
              ? Variable(inventoryChanges.minCount.value)
              : old.minCount,
          maxCount: inventoryChanges.maxCount.present
              ? Variable(inventoryChanges.maxCount.value)
              : old.maxCount,
          fixedSuggestion: inventoryChanges.fixedSuggestion.present
              ? Variable(inventoryChanges.fixedSuggestion.value)
              : old.fixedSuggestion,
          stockCountChange: old.stockCountChange +
              Variable(inventoryChanges.stockCountChange.value),
          modified: Variable(DateTime.now().toUtc()),
        ),
      ),
    );
  }

  Future<List<InventoryChangesEntityData>> getInventoryChanges() {
    final query = select(inventoryChangesEntity);

    return query.get();
  }

  Future<int> deleteInventoryChangesById(String itemId) {
    return (delete(inventoryChangesEntity)
          ..where((tbl) => tbl.itemId.equals(itemId)))
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

  Future<int> deleteIdFromDeletedInventory(int id) {
    return (delete(deletedInventoryEntity)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
