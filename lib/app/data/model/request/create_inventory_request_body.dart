import 'package:dental_inventory/app/core/values/string_extensions.dart';

class CreateInventoryRequestBody {
  CreateInventoryRequestBody({
    this.itemId,
    this.maxCount,
    this.minCount,
    this.stockCount,
    this.fixedSuggestion,
  });

  String? itemId;
  String? maxCount;
  String? minCount;
  String? stockCount;
  String? fixedSuggestion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_item_id'] = itemId;

    if (maxCount.isNotNullOrEmpty) {
      map['max_count'] = maxCount;
    }

    if (minCount.isNotNullOrEmpty) {
      map['min_count'] = minCount;
    }

    if (stockCount.isNotNullOrEmpty) {
      map['stock_count'] = stockCount;
    }

    if (fixedSuggestion.isNotNullOrEmpty) {
      map['fixed_suggestion'] = fixedSuggestion;
    }

    return map;
  }
}
