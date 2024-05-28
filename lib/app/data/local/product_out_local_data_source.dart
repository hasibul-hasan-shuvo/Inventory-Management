import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';

abstract class ProductOutLocalDataSource {
  Future<ScannedProductEntityData?> getProductByItemId(String itemId);

  Future<List<ScannedProductEntityData>> getProducts();

  Future<int> insertProduct(ProductOutScannedItemEntityCompanion product);

  Future<int> updateProduct(ProductOutScannedItemEntityCompanion product);

  Future<int> deleteProductByItemId(String itemId);

  Future<void> deleteProducts();
}
