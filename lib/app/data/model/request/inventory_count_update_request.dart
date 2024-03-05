class InventoryCountUpdateRequest {
  final String inventoryID;
  final String id;
  final String product;
  final String maxCount;
  final String minCount;
  final String stockCount;

  InventoryCountUpdateRequest({
    required this.inventoryID,
    required this.id,
    required this.product,
    required this.maxCount,
    required this.minCount,
    required this.stockCount,
  });

  String get productID => id;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['inventory'] = inventoryID;
    data['id'] = id;
    data['product'] = int.tryParse(product);
    data['max_count'] = int.tryParse(maxCount);
    data['min_count'] = int.tryParse(minCount);
    data['stock_count'] = int.tryParse(stockCount);

    return data;
  }
}
