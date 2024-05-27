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

  Future<bool> updateProduct(ProductInScannedItemEntityData product) {
    return update(productInScannedItemEntity).replace(product);
  }

  Future<List<ScannedProductEntityData>> getProducts() {
    final query = select(productInScannedItemEntity).join([
      leftOuterJoin(inventoryEntity,
          inventoryEntity.id.equalsExp(productInScannedItemEntity.id))
    ]);

    return query.get().then((rows) {
      return rows.map((e) {
        ProductInScannedItemEntityData scannedProduct =
            e.readTable(productInScannedItemEntity);
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

  Future<void> deleteProductById(int id) {
    return (delete(productInScannedItemEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<void> deleteProducts() {
    return batch((batch) => batch.deleteAll(productInScannedItemEntity));
  }
}
