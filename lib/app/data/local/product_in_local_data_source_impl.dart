import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/dao/product_in_dao.dart';
import 'package:dental_inventory/app/data/local/product_in_local_data_source.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:get/get.dart';

class ProductInLocalDataSourceImpl implements ProductInLocalDataSource {
  final ProductInDao _dao = ProductInDao(Get.find());

  @override
  Future<ScannedProductEntityData?> getProductByItemId(String itemId) {
    return _dao.getProductByItemId(itemId);
  }

  @override
  Future<List<ScannedProductEntityData>> getProducts() {
    return _dao.getProducts();
  }

  @override
  Future<int> insertProduct(ProductInScannedItemEntityCompanion product) {
    return _dao.insertProduct(product);
  }

  @override
  Future<int> updateProduct(ProductInScannedItemEntityCompanion product) {
    return _dao.updateProduct(product);
  }

  @override
  Future<int> deleteProductByItemId(String itemId) {
    return _dao.deleteProductByItemId(itemId);
  }

  @override
  Future<void> deleteProducts() {
    return _dao.deleteProducts();
  }
}
