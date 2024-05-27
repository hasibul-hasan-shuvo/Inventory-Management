import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';

abstract class ProductOutLocalDataSource {
  Future<ScannedProductEntityData?> getProductById(int id);

  Future<List<ScannedProductEntityData>> getProducts();

  Future<int> insertProduct(ProductOutScannedItemEntityCompanion product);

  Future<int> updateProduct(ProductOutScannedItemEntityCompanion product);

  Future<int> deleteProductById(int id);

  Future<void> deleteProducts();
}
