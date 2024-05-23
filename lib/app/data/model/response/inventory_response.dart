import 'package:dental_inventory/app/data/model/response/product_response.dart';

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
  int? id;
  ProductResponse? product;
  ConnectedCartItemResponse? connectedCartItem;
  String? created;
  String? modified;
  int? maxCount;
  int? minCount;
  int? stockCount;
  int? fixedSuggestion;
  int? inventory;

  InventoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'] != null
        ? ProductResponse.fromJson(json['product'])
        : null;
    connectedCartItem = json['connected_cart_item'] != null
        ? ConnectedCartItemResponse.fromJson(json['connected_cart_item'])
        : null;
    created = json['created'];
    modified = json['modified'];
    maxCount = json['max_count'];
    minCount = json['min_count'];
    stockCount = json['stock_count'];
    fixedSuggestion = json['fixed_suggestion'];
    inventory = json['inventory'];
  }
}

class ConnectedCartItemResponse {
  ConnectedCartItemResponse.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  int? id;
  int? quantity;
}
