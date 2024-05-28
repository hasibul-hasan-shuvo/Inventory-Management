import 'dart:convert';

import 'package:dental_inventory/app/data/model/response/product_entity_data.dart';
import 'package:dental_inventory/app/data/model/response/product_response.dart';

class ScannedProductUiModel {
  late final int id;
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int number;
  late final int available;

  ScannedProductUiModel.fromScannedProductEntityData(
    ScannedProductEntityData data, {
    bool addStockCount = false,
  }) {
    ProductResponse product =
        ProductResponse.fromJson(jsonDecode(data.product));

    id = data.id;
    itemId = product.itemId ?? '';
    name = product.name ?? '';
    imageUrl = product.imageUrl ?? '';
    number = addStockCount
        ? data.stockCount + data.stockCountChange
        : data.stockCountChange;
    available = data.stockCount;
  }

  void updateNumber(int newNumber) {
    number = newNumber;
  }
}
