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
          ..where((tbl) => tbl.id.equals(product.id.value)))
        .write(product);
  }

  Future<List<ScannedProductEntityData>> getProducts() {
    final query = select(productOutScannedItemEntity).join([
      leftOuterJoin(inventoryEntity,
          inventoryEntity.id.equalsExp(productOutScannedItemEntity.id))
    ]);

    return query.get().then((rows) {
      return rows.map((e) {
        ProductOutScannedItemEntityData scannedProduct =
            e.readTable(productOutScannedItemEntity);
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
    final query = select(productOutScannedItemEntity).join([
      leftOuterJoin(inventoryEntity,
          inventoryEntity.id.equalsExp(productOutScannedItemEntity.id))
    ])
      ..where(productOutScannedItemEntity.id.equals(id));

    return query.getSingleOrNull().then((row) {
      if (row != null) {
        ProductOutScannedItemEntityData scannedProduct =
            row.readTable(productOutScannedItemEntity);
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
    return (delete(productOutScannedItemEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<void> deleteProducts() {
    return batch((batch) => batch.deleteAll(productOutScannedItemEntity));
  }
}
