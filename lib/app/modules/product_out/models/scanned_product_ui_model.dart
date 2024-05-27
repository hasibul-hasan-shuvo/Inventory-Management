import 'dart:convert';

import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:dental_inventory/app/data/model/response/product_response.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';

class ScannedProductUiModel {
  late final int id;
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int number;
  late final int available;

  ScannedProductUiModel.fromScannedProductEntityData(
      ScannedProductEntityData data) {
    ProductResponse product =
        ProductResponse.fromJson(jsonDecode(data.product));

    id = data.id;
    itemId = product.itemId ?? '';
    name = product.name ?? '';
    imageUrl = product.imageUrl ?? '';
    number = data.stockCountChange;
    available = data.stockCount;
  }

  ScannedProductUiModel.fromInventoryEntityDataWithDefaultNumber(
      InventoryEntityData data) {
    ProductResponse product =
        ProductResponse.fromJson(jsonDecode(data.product));

    id = data.id;
    itemId = product.itemId ?? '';
    name = product.name ?? '';
    imageUrl = product.imageUrl ?? '';
    number = 1;
    available = data.stockCount;
  }

  ScannedProductUiModel.fromInventoryEntityData(InventoryEntityData data) {
    ProductResponse product =
        ProductResponse.fromJson(jsonDecode(data.product));

    id = data.id;
    itemId = product.itemId ?? '';
    name = product.name ?? '';
    imageUrl = product.imageUrl ?? '';
    number = data.stockCount;
    available = data.stockCount;
  }

  ScannedProductUiModel.addProductFromInventory(
      SelectableInventoryItemUiModel data) {
    id = data.id;
    itemId = data.itemId;
    name = data.name;
    imageUrl = data.imageUrl;
    number = data.number;
    available = data.available;
  }

  void updateNumber(int newNumber) {
    number = newNumber;
  }

  ScannedProductsRequestBody toScannedProductsRequestBodyWithCountChange(
      bool isPositive) {
    return ScannedProductsRequestBody(
      itemId: itemId,
      countChange: isPositive ? number : number * -1,
    );
  }

  ScannedProductsRequestBody toScannedProductsRequestBodyWithCurrentStock() {
    return ScannedProductsRequestBody(
      itemId: itemId,
      currentStock: number,
    );
  }
}
