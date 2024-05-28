import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/product_count_scanned_item_entity.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:drift/drift.dart';

part 'product_count_dao.g.dart';

@DriftAccessor(tables: [
  ProductCountScannedItemEntity,
  InventoryEntity,
])
class ProductCountDao extends DatabaseAccessor<AppDatabase>
    with _$ProductCountDaoMixin {
  ProductCountDao(super.attachedDatabase);

  Future<int> insertProduct(ProductCountScannedItemEntityCompanion product) {
    return into(productCountScannedItemEntity).insertOnConflictUpdate(product);
  }

  Future<int> updateProduct(ProductCountScannedItemEntityCompanion product) {
    return (update(productCountScannedItemEntity)
          ..where((tbl) => tbl.itemId.equals(product.itemId.value)))
        .write(product);
  }

  Future<List<ScannedProductEntityData>> getProducts() {
    final query = select(productCountScannedItemEntity).join([
      leftOuterJoin(
          inventoryEntity,
          inventoryEntity.itemId
              .equalsExp(productCountScannedItemEntity.itemId))
    ]);

    return query.get().then((rows) {
      return rows.map((e) {
        ProductCountScannedItemEntityData scannedProduct =
            e.readTable(productCountScannedItemEntity);
        InventoryEntityData inventory = e.readTable(inventoryEntity);

        return ScannedProductEntityData(
          itemId: scannedProduct.itemId,
          product: inventory.product,
          stockCountChange: scannedProduct.stockCountChange,
          stockCount: inventory.stockCount,
        );
      }).toList();
    });
  }

  Future<ScannedProductEntityData?> getProductByItemId(String itemId) {
    final query = select(productCountScannedItemEntity).join([
      leftOuterJoin(
          inventoryEntity,
          inventoryEntity.itemId
              .equalsExp(productCountScannedItemEntity.itemId))
    ])
      ..where(productCountScannedItemEntity.itemId.equals(itemId));

    return query.getSingleOrNull().then((row) {
      if (row != null) {
        ProductCountScannedItemEntityData scannedProduct =
            row.readTable(productCountScannedItemEntity);
        InventoryEntityData inventory = row.readTable(inventoryEntity);

        return ScannedProductEntityData(
          itemId: scannedProduct.itemId,
          product: inventory.product,
          stockCountChange: scannedProduct.stockCountChange,
          stockCount: inventory.stockCount,
        );
      }

      return null;
    });
  }

  Future<int> deleteProductByItemId(String itemId) {
    return (delete(productCountScannedItemEntity)
          ..where((tbl) => tbl.itemId.equals(itemId)))
        .go();
  }

  Future<void> deleteProducts() {
    return batch((batch) => batch.deleteAll(productCountScannedItemEntity));
  }
}
