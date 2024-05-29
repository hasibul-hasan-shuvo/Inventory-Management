import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/product_in_scanned_item_entity.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:drift/drift.dart';

part 'product_in_dao.g.dart';

@DriftAccessor(tables: [
  ProductInScannedItemEntity,
  InventoryEntity,
])
class ProductInDao extends DatabaseAccessor<AppDatabase>
    with _$ProductInDaoMixin {
  ProductInDao(super.attachedDatabase);

  Future<int> insertProduct(ProductInScannedItemEntityCompanion product) {
    return into(productInScannedItemEntity).insertOnConflictUpdate(product);
  }

  Future<int> updateProduct(ProductInScannedItemEntityCompanion product) {
    return (update(productInScannedItemEntity)
          ..where((tbl) => tbl.itemId.equals(product.itemId.value)))
        .write(product);
  }

  Future<List<ScannedProductEntityData>> getProducts() {
    final query = select(productInScannedItemEntity).join([
      leftOuterJoin(inventoryEntity,
          inventoryEntity.itemId.equalsExp(productInScannedItemEntity.itemId))
    ]);

    return query.get().then((rows) {
      return rows.map((e) {
        ProductInScannedItemEntityData scannedProduct =
            e.readTable(productInScannedItemEntity);
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
    final query = select(productInScannedItemEntity).join([
      leftOuterJoin(inventoryEntity,
          inventoryEntity.itemId.equalsExp(productInScannedItemEntity.itemId))
    ])
      ..where(productInScannedItemEntity.itemId.equals(itemId));

    return query.getSingleOrNull().then((row) {
      if (row != null) {
        ProductInScannedItemEntityData scannedProduct =
            row.readTable(productInScannedItemEntity);
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
    return (delete(productInScannedItemEntity)
          ..where((tbl) => tbl.itemId.equals(itemId)))
        .go();
  }

  Future<void> deleteProducts() {
    return batch((batch) => batch.deleteAll(productInScannedItemEntity));
  }
}
