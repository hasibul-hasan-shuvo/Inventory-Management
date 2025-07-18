import 'package:dental_inventory/app/core/utils/date_parser.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:drift/drift.dart';

class CreateInventoryRequestBody {
  CreateInventoryRequestBody({
    required this.itemId,
    this.productName = '',
    this.product = '{}',
    this.maxCount,
    this.minCount,
    this.stockCount,
    this.fixedSuggestion,
    this.replaceWith,
  });

  String itemId;
  String productName;
  String product;
  String? maxCount;
  String? minCount;
  String? stockCount;
  String? fixedSuggestion;
  String? replaceWith;

  InventoryEntityCompanion toInventoryEntityCompanion() {
    return InventoryEntityCompanion(
      itemId: Value(itemId),
      productName: Value(productName),
      product: Value(product),
      maxCount: maxCount != null ? Value(maxCount.toInt) : const Value.absent(),
      minCount: minCount != null ? Value(minCount.toInt) : const Value.absent(),
      stockCount: Value(stockCount.toInt),
      fixedSuggestion: fixedSuggestion != null
          ? Value(fixedSuggestion.toInt)
          : const Value.absent(),
      created: Value(DateParser.getCurrentUtcDateTime),
      modified: Value(DateParser.getCurrentUtcDateTime),
    );
  }

  InventoryChangesEntityCompanion toInventoryChangesEntityCompanion() {
    return InventoryChangesEntityCompanion.insert(
      itemId: itemId,
      maxCount: maxCount != null ? Value(maxCount.toInt) : const Value.absent(),
      minCount: minCount != null ? Value(minCount.toInt) : const Value.absent(),
      stockCountChange: Value(stockCount.toInt),
      fixedSuggestion: fixedSuggestion != null
          ? Value(fixedSuggestion.toInt)
          : const Value.absent(),
      modified: Value(DateParser.getCurrentUtcDateTime),
      replaceWith:
          replaceWith != null ? Value(replaceWith) : const Value.absent(),
    );
  }

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
