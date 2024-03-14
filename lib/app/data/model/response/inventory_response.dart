import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';

class InventoryResponse {
  InventoryResponse({
    this.status,
    this.data,
  });

  InventoryResponse.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Status? status;
  Data? data;

  InventoryResponse copyWith({
    Status? status,
    Data? data,
  }) =>
      InventoryResponse(
        status: status ?? this.status,
        data: data ?? this.data,
      );
}

class Data {
  Data({
    this.count,
    this.next,
    this.previous,
    this.inventoryList,
  });

  Data.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      inventoryList = [];
      json['results'].forEach((v) {
        inventoryList?.add(InventoryNetworkModel.fromJson(v));
      });
    }
  }

  int? count;
  dynamic next;
  dynamic previous;
  List<InventoryNetworkModel>? inventoryList;

  Data copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<InventoryNetworkModel>? inventoryList,
  }) =>
      Data(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        inventoryList: inventoryList ?? this.inventoryList,
      );
}

class InventoryNetworkModel {
  InventoryNetworkModel({
    this.id,
    this.product,
    this.created,
    this.modified,
    this.maxCount,
    this.minCount,
    this.stockCount,
    this.suggestedOrderCount,
    this.inventory,
  });

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

  InventoryNetworkModel.fromJson(dynamic json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    created = json['created'];
    modified = json['modified'];
    maxCount = json['max_count'];
    minCount = json['min_count'];
    stockCount = json['stock_count'];
    suggestedOrderCount = json['suggested_order_count'];
    inventory = json['inventory'];
  }

  int? id;
  Product? product;
  String? created;
  String? modified;
  int? maxCount;
  int? minCount;
  int? stockCount;
  int? suggestedOrderCount;
  int? inventory;
}

class Product {
  Product({
    this.id,
    this.name,
    this.itemId,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    itemId = json['item_id'];
  }

  int? id;
  String? name;
  String? itemId;
}

class Status {
  Status({
    this.code,
    this.message,
  });

  Status.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
  }

  int? code;
  String? message;
}
