import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';

abstract class ProductInRepository {
  Future<ScannedProductEntityData?> addProductByItemId(
      String itemId, int stockCountChange);

  Future<ScannedProductEntityData?> getProductByItemId(String itemId);

  Future<List<ScannedProductEntityData>> getProducts();

  Future<int> updateProduct(String itemId, int stockCountChange);

  Future<int> deleteProductByItemId(String itemId);

  Future<void> deleteProducts();

  Future<List<ScannedProductEntityData>> revertAllItems();
}
