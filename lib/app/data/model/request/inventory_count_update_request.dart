class InventoryCountUpdateRequest {
  final String inventoryID;
  final String id;
  final String maxCount;
  final String minCount;
  final String stockCount;
  final String fixedSuggestion;

  InventoryCountUpdateRequest({
    required this.inventoryID,
    required this.id,
    required this.maxCount,
    required this.minCount,
    required this.stockCount,
    required this.fixedSuggestion,
  });

  String get productID => id;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['inventory'] = inventoryID;
    data['id'] = id;
    data['max_count'] = int.tryParse(maxCount);
    data['min_count'] = int.tryParse(minCount);
    data['stock_count'] = int.tryParse(stockCount);
    data['fixed_suggestion'] = int.tryParse(fixedSuggestion);

    return data;
  }
}
