import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/entities/inventory_entity.dart';
import 'package:dental_inventory/app/data/local/db/entities/product_in_entity.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:drift/drift.dart';

part 'product_in_dao.g.dart';

@DriftAccessor(tables: [
  ProductInEntity,
  InventoryEntity,
])
class ProductInDao extends DatabaseAccessor<AppDatabase>
    with _$ProductInDaoMixin {
  ProductInDao(super.attachedDatabase);

  Future<int> insertProduct(ProductInEntityCompanion product) {
    return into(productInEntity).insertOnConflictUpdate(product);
  }

  Future<bool> updateProduct(ProductInEntityData product) {
    return update(productInEntity).replace(product);
  }

  Future<List<ProductEntityData>> getProducts() {
    final query = select(productInEntity).join([
      leftOuterJoin(
          inventoryEntity, inventoryEntity.id.equalsExp(productInEntity.id))
    ]);

    return query.get().then((rows) {
      return rows.map((e) {
        ProductInEntityData scannedProduct = e.readTable(productInEntity);
        InventoryEntityData inventory = e.readTable(inventoryEntity);

        return ProductEntityData(
          id: scannedProduct.id,
          product: inventory.product,
          stockCountChange: scannedProduct.stockCountChange,
          stockCount: inventory.stockCount,
        );
      }).toList();
    });
  }

  Future<void> deleteProductById(int id) {
    return (delete(productInEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> deleteProducts() {
    return batch((batch) => batch.deleteAll(productInEntity));
  }
}
