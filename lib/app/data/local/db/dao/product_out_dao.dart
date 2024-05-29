import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/product_out_scanned_item_entity.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:drift/drift.dart';

part 'product_out_dao.g.dart';

@DriftAccessor(tables: [
  ProductOutScannedItemEntity,
  InventoryEntity,
])
class ProductOutDao extends DatabaseAccessor<AppDatabase>
    with _$ProductOutDaoMixin {
  ProductOutDao(super.attachedDatabase);

  Future<int> insertProduct(ProductOutScannedItemEntityCompanion product) {
    return into(productOutScannedItemEntity).insertOnConflictUpdate(product);
  }

  Future<int> updateProduct(ProductOutScannedItemEntityCompanion product) {
    return (update(productOutScannedItemEntity)
          ..where((tbl) => tbl.itemId.equals(product.itemId.value)))
        .write(product);
  }

  Future<List<ScannedProductEntityData>> getProducts() {
    final query = select(productOutScannedItemEntity).join([
      leftOuterJoin(inventoryEntity,
          inventoryEntity.itemId.equalsExp(productOutScannedItemEntity.itemId))
    ]);

    return query.get().then((rows) {
      return rows.map((e) {
        ProductOutScannedItemEntityData scannedProduct =
            e.readTable(productOutScannedItemEntity);
        InventoryEntityData inventory = e.readTable(inventoryEntity);

        return ScannedProductEntityData(
          id: inventory.id,
          itemId: scannedProduct.itemId,
          product: inventory.product,
          stockCountChange: scannedProduct.stockCountChange,
          stockCount: inventory.stockCount,
        );
      }).toList();
    });
  }

  Future<ScannedProductEntityData?> getProductByItemId(String itemId) {
    final query = select(productOutScannedItemEntity).join([
      leftOuterJoin(inventoryEntity,
          inventoryEntity.itemId.equalsExp(productOutScannedItemEntity.itemId))
    ])
      ..where(productOutScannedItemEntity.itemId.equals(itemId));

    return query.getSingleOrNull().then((row) {
      if (row != null) {
        ProductOutScannedItemEntityData scannedProduct =
            row.readTable(productOutScannedItemEntity);
        InventoryEntityData inventory = row.readTable(inventoryEntity);

        return ScannedProductEntityData(
          id: inventory.id,
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
    return (delete(productOutScannedItemEntity)
          ..where((tbl) => tbl.itemId.equals(itemId)))
        .go();
  }

  Future<void> deleteProducts() {
    return batch((batch) => batch.deleteAll(productOutScannedItemEntity));
  }
}
