import 'dart:convert';

import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/response/product_response.dart';

class InventoryUiModel {
  late final int? id;
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int max;
  late int min;
  late int currentStock;
  late int fixedOrderSuggestions;
  late final double price;
  late final bool isAvailable;
  late final String alternativeItemId;

  InventoryUiModel.fromInventoryEntityData(InventoryEntityData data) {
    ProductResponse product =
        ProductResponse.fromJson(jsonDecode(data.product));

    id = data.id;
    itemId = product.itemId ?? '';
    name = product.name ?? '';
    imageUrl = product.imageUrl ?? '';
    max = data.maxCount ?? 0;
    min = data.minCount ?? 0;
    currentStock = data.stockCount;
    fixedOrderSuggestions = data.fixedSuggestion ?? 0;
    price = product.price?.toDouble() ?? 0.0;
    isAvailable = false; //data.isAvailable;
    alternativeItemId = data.alternativeItemId ?? '';
  }

  updateFromInventoryEntityData(InventoryEntityData response) {
    max = response.maxCount ?? 0;
    min = response.minCount ?? 0;
    currentStock = response.stockCount;
    fixedOrderSuggestions = response.fixedSuggestion ?? 0;
  }
}
