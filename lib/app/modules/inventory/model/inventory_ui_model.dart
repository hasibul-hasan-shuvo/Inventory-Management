import 'dart:convert';

import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/response/product_response.dart';

class InventoryUIModel {
  late final int id;
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int max;
  late int min;
  late int currentStock;
  late int fixedOrderSuggestions;
  late final double price;

  InventoryUIModel.fromInventoryEntityData(InventoryEntityData data) {
    ProductResponse product =
        ProductResponse.fromJson(jsonDecode(data.product));

    id = data.id;
    itemId = product.itemId ?? '';
    name = product.name ?? '';
    imageUrl = product.imageUrl ?? '';
    max = data.maxCount;
    min = data.minCount;
    currentStock = data.stockCount;
    fixedOrderSuggestions = data.fixedSuggestion;
    price = product.price?.toDouble() ?? 0.0;
  }

  updateFromInventoryEntityData(InventoryEntityData response) {
    max = response.maxCount;
    min = response.minCount;
    currentStock = response.stockCount;
    fixedOrderSuggestions = response.fixedSuggestion;
  }
}
