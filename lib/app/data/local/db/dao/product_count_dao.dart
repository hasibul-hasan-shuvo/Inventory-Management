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
          ..where((tbl) => tbl.id.equals(product.id.value)))
        .write(product);
  }

  Future<List<ScannedProductEntityData>> getProducts() {
    final query = select(productCountScannedItemEntity).join([
      leftOuterJoin(inventoryEntity,
          inventoryEntity.id.equalsExp(productCountScannedItemEntity.id))
    ]);

    return query.get().then((rows) {
      return rows.map((e) {
        ProductCountScannedItemEntityData scannedProduct =
            e.readTable(productCountScannedItemEntity);
        InventoryEntityData inventory = e.readTable(inventoryEntity);

        return ScannedProductEntityData(
          id: scannedProduct.id,
          product: inventory.product,
          stockCountChange: scannedProduct.stockCountChange,
          stockCount: inventory.stockCount,
        );
      }).toList();
    });
  }

  Future<ScannedProductEntityData?> getProductById(int id) {
    final query = select(productCountScannedItemEntity).join([
      leftOuterJoin(inventoryEntity,
          inventoryEntity.id.equalsExp(productCountScannedItemEntity.id))
    ])
      ..where(productCountScannedItemEntity.id.equals(id));

    return query.getSingleOrNull().then((row) {
      if (row != null) {
        ProductCountScannedItemEntityData scannedProduct =
            row.readTable(productCountScannedItemEntity);
        InventoryEntityData inventory = row.readTable(inventoryEntity);

        return ScannedProductEntityData(
          id: scannedProduct.id,
          product: inventory.product,
          stockCountChange: scannedProduct.stockCountChange,
          stockCount: inventory.stockCount,
        );
      }

      return null;
    });
  }

  Future<int> deleteProductById(int id) {
    return (delete(productCountScannedItemEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<void> deleteProducts() {
    return batch((batch) => batch.deleteAll(productCountScannedItemEntity));
  }
}
