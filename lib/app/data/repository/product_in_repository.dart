import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';

abstract class ProductInRepository {
  Future<ScannedProductEntityData?> addProductByInventoryId(
      int id, int stockCountChange);

  Future<ScannedProductEntityData?> getProductById(String itemId);

  Future<List<ScannedProductEntityData>> getProducts();

  Future<int> updateProduct(int id, int stockCountChange);

  Future<int> deleteProductById(int id);

  Future<void> deleteProducts();
}
