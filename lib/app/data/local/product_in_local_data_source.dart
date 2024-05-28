import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';

abstract class ProductInLocalDataSource {
  Future<ScannedProductEntityData?> getProductByItemId(String itemId);

  Future<List<ScannedProductEntityData>> getProducts();

  Future<int> insertProduct(ProductInScannedItemEntityCompanion product);

  Future<int> updateProduct(ProductInScannedItemEntityCompanion product);

  Future<int> deleteProductByItemId(String itemId);

  Future<void> deleteProducts();
}
