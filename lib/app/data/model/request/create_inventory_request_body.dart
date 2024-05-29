import 'package:dental_inventory/app/core/utils/date_parser.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:drift/drift.dart';

class CreateInventoryRequestBody {
  CreateInventoryRequestBody({
    required this.itemId,
    this.maxCount,
    this.minCount,
    this.stockCount,
    this.fixedSuggestion,
  });

  String itemId;
  String? maxCount;
  String? minCount;
  String? stockCount;
  String? fixedSuggestion;

  InventoryEntityCompanion toInventoryEntityCompanion() {
    return InventoryEntityCompanion(
      maxCount: maxCount != null ? Value(maxCount.toInt) : const Value.absent(),
      minCount: minCount != null ? Value(minCount.toInt) : const Value.absent(),
      stockCount: Value(stockCount.toInt),
      fixedSuggestion: fixedSuggestion != null
          ? Value(fixedSuggestion.toInt)
          : const Value.absent(),
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
