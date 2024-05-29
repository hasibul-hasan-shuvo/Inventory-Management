import 'package:dental_inventory/app/core/utils/date_parser.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/product_in_local_data_source.dart';
import 'package:dental_inventory/app/data/model/request/inventory_update_request_body.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/product_in_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/network/exceptions/not_found_exception.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:drift/drift.dart' as drift;
import 'package:get/get.dart';

class ProductInRepositoryImpl implements ProductInRepository {
  final InventoryRepository _inventoryRepository = Get.find();
  final ProductInLocalDataSource _localDataSource = Get.find();

  @override
  Future<ScannedProductEntityData?> addProductByItemId(
      String itemId, int stockCountChange) {
    ProductInScannedItemEntityCompanion scannedProduct =
        ProductInScannedItemEntityCompanion.insert(
      itemId: itemId,
      stockCountChange: stockCountChange,
      modified: drift.Value(DateParser.getCurrentUtcDateTime),
    );

    return _localDataSource.insertProduct(scannedProduct).then((value) {
      return _localDataSource.getProductByItemId(itemId);
    });
  }

  @override
  Future<ScannedProductEntityData?> getProductByItemId(String itemId) {
    return _inventoryRepository
        .getInventoryByItemId(itemId)
        .then((InventoryEntityData? inventory) {
      if (inventory == null) {
        throw NotFoundException('', '');
      }

      return addProductByItemId(itemId, 1);
    });
  }

  @override
  Future<List<ScannedProductEntityData>> getProducts() {
    return _localDataSource.getProducts();
  }

  @override
  Future<int> updateProduct(String itemId, int stockCountChange) {
    ProductInScannedItemEntityCompanion product =
        ProductInScannedItemEntityCompanion(
      itemId: drift.Value(itemId),
      stockCountChange: drift.Value(stockCountChange),
      modified: drift.Value(DateParser.getCurrentUtcDateTime),
    );

    return _localDataSource.updateProduct(product);
  }

  @override
  Future<int> deleteProductByItemId(String itemId) {
    return _localDataSource.deleteProductByItemId(itemId);
  }

  @override
  Future<void> deleteProducts() {
    return _localDataSource.deleteProducts();
  }

  @override
  Future<List<ScannedProductEntityData>> revertAllItems() {
    return getProducts().then((list) async {
      List<ScannedProductUiModel> scannedList = list
          .map((e) => ScannedProductUiModel.fromScannedProductEntityData(e))
          .toList();

      for (ScannedProductUiModel product in scannedList) {
        try {
          InventoryUpdateRequestBody requestBody = InventoryUpdateRequestBody(
            id: product.id,
            itemId: product.itemId,
            stockCount: product.available + product.number,
            stockCountChange: product.number,
          );

          await _inventoryRepository.updateInventoryData(requestBody);

          await deleteProductByItemId(product.itemId);
        } catch (e) {
          BuildConfig.instance.config.logger.e("RevertAllItemsError: $e");
        }
      }

      return getProducts();
    });
  }
}
