import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/db/dao/product_count_dao.dart';
import 'package:dental_inventory/app/data/local/product_count_local_data_source.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:get/get.dart';

class ProductCountLocalDataSourceImpl implements ProductCountLocalDataSource {
  final ProductCountDao _dao = ProductCountDao(Get.find());

  @override
  Future<ScannedProductEntityData?> getProductById(int id) {
    return _dao.getProductById(id);
  }

  @override
  Future<List<ScannedProductEntityData>> getProducts() {
    return _dao.getProducts();
  }

  @override
  Future<int> insertProduct(ProductCountScannedItemEntityCompanion product) {
    return _dao.insertProduct(product);
  }

  @override
  Future<int> updateProduct(ProductCountScannedItemEntityCompanion product) {
    return _dao.updateProduct(product);
  }

  @override
  Future<int> deleteProductById(int id) {
    return _dao.deleteProductById(id);
  }

  @override
  Future<void> deleteProducts() {
    return _dao.deleteProducts();
  }
}
