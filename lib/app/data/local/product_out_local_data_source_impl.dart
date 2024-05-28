import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/dao/product_out_dao.dart';
import 'package:dental_inventory/app/data/local/product_out_local_data_source.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:get/get.dart';

class ProductOutLocalDataSourceImpl implements ProductOutLocalDataSource {
  final ProductOutDao _dao = ProductOutDao(Get.find());

  @override
  Future<ScannedProductEntityData?> getProductByItemId(String itemId) {
    return _dao.getProductByItemId(itemId);
  }

  @override
  Future<List<ScannedProductEntityData>> getProducts() {
    return _dao.getProducts();
  }

  @override
  Future<int> insertProduct(ProductOutScannedItemEntityCompanion product) {
    return _dao.insertProduct(product);
  }

  @override
  Future<int> updateProduct(ProductOutScannedItemEntityCompanion product) {
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
