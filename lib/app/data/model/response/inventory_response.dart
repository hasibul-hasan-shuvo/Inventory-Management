import 'package:dental_inventory/app/data/model/response/product_response.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';

class InventoryListResponse {
  InventoryListResponse.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      inventoryList = [];
      json['results'].forEach((v) {
        inventoryList?.add(InventoryResponse.fromJson(v));
      });
    }
  }

  int? count;
  String? next;
  String? previous;
  List<InventoryResponse>? inventoryList;
}

class InventoryResponse {
  InventoryCardUIModel toInventoryCardUIModel() {
    return InventoryCardUIModel(
      id: id.toString(),
      maxTreshold: maxCount.toString(),
      minTreshold: minCount.toString(),
      productName: product?.name ?? '',
      currentStock: stockCount.toString(),
      productCode: product?.itemId.toString() ?? '',
      fixedOrderSuggestions: "${suggestedOrderCount ?? 0}",
    );
  }

  InventoryResponse.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null
        ? ProductResponse.fromJson(json['product'])
        : null;
    created = json['created'];
    modified = json['modified'];
    maxCount = json['max_count'];
    minCount = json['min_count'];
    stockCount = json['stock_count'];
    suggestedOrderCount = json['suggested_order_count'];
    inventory = json['inventory'];
  }

  int? id;
  ProductResponse? product;
  String? created;
  String? modified;
  int? maxCount;
  int? minCount;
  int? stockCount;
  int? suggestedOrderCount;
  int? inventory;
}
