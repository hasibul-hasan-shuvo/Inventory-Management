import 'package:dental_inventory/app/core/utils/date_parser.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/product_in_local_data_source.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/product_in_repository.dart';
import 'package:dental_inventory/app/network/exceptions/not_found_exception.dart';
import 'package:drift/drift.dart' as drift;
import 'package:get/get.dart';

class ProductInRepositoryImpl implements ProductInRepository {
  final InventoryRepository _inventoryRepository = Get.find();
  final ProductInLocalDataSource _localDataSource = Get.find();

  @override
  Future<ScannedProductEntityData?> addProductByInventoryId(
      int id, int stockCountChange) {
    ProductInScannedItemEntityCompanion scannedProduct =
        ProductInScannedItemEntityCompanion.insert(
      id: drift.Value(id),
      stockCountChange: stockCountChange,
      modified: drift.Value(DateParser.getCurrentUtcDateTime),
    );

    return _localDataSource.insertProduct(scannedProduct).then((value) {
      return _localDataSource.getProductById(id);
    });
  }

  @override
  Future<ScannedProductEntityData?> getProductById(String itemId) {
    return _inventoryRepository
        .getInventoryByItemId(itemId)
        .then((InventoryEntityData? inventory) {
      if (inventory == null) {
        throw NotFoundException('', '');
      }

      return addProductByInventoryId(inventory.id, 1);
    });
  }

  @override
  Future<List<ScannedProductEntityData>> getProducts() {
    return _localDataSource.getProducts();
  }

  @override
  Future<int> updateProduct(int id, int stockCountChange) {
    ProductInScannedItemEntityCompanion product =
        ProductInScannedItemEntityCompanion(
      id: drift.Value(id),
      stockCountChange: drift.Value(stockCountChange),
      modified: drift.Value(DateParser.getCurrentUtcDateTime),
    );

    return _localDataSource.updateProduct(product);
  }

  @override
  Future<int> deleteProductById(int id) {
    return _localDataSource.deleteProductById(id);
  }

  @override
  Future<void> deleteProducts() {
    return _localDataSource.deleteProducts();
  }
}
