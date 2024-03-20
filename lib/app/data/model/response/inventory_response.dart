

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
  Product? product;
  String? created;
  String? modified;
  int? maxCount;
  int? minCount;
  int? stockCount;
  int? fixedSuggestion;
  int? inventory;

  InventoryResponse(
      {this.id,
      this.product,
      this.created,
      this.modified,
      this.maxCount,
      this.minCount,
      this.stockCount,
      this.fixedSuggestion,
      this.inventory});

  InventoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    created = json['created'];
    modified = json['modified'];
    maxCount = json['max_count'];
    minCount = json['min_count'];
    stockCount = json['stock_count'];
    fixedSuggestion = json['fixed_suggestion'];
    inventory = json['inventory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['created'] = created;
    data['modified'] = modified;
    data['max_count'] = maxCount;
    data['min_count'] = minCount;
    data['stock_count'] = stockCount;
    data['fixed_suggestion'] = fixedSuggestion;
    data['inventory'] = inventory;

    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? itemId;
  String? imageUrl;

  Product({this.id, this.name, this.itemId, this.imageUrl});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    itemId = json['item_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['item_id'] = itemId;
    data['image_url'] = imageUrl;

    return data;
  }
}
