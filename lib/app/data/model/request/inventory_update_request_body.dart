import 'package:dental_inventory/app/core/utils/date_parser.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:drift/drift.dart';

class InventoryUpdateRequestBody {
  int? id;
  String itemId;
  int? maxCount;
  int? minCount;
  int? stockCount;
  int? stockCountChange;
  int? fixedSuggestion;
  String? replaceWith;

  InventoryUpdateRequestBody({
    required this.itemId,
    this.id,
    this.maxCount,
    this.minCount,
    this.stockCount,
    this.stockCountChange,
    this.fixedSuggestion,
    this.replaceWith,
  });

  String get productID => itemId;

  InventoryEntityCompanion toInventoryEntityCompanion() {
    return InventoryEntityCompanion(
      maxCount: maxCount != null ? Value(maxCount!) : const Value.absent(),
      minCount: minCount != null ? Value(minCount!) : const Value.absent(),
      stockCount: Value(stockCount ?? 0),
      fixedSuggestion: fixedSuggestion != null
          ? Value(fixedSuggestion!)
          : const Value.absent(),
    );
  }

  InventoryChangesEntityCompanion toInventoryChangesEntityCompanion() {
    return InventoryChangesEntityCompanion.insert(
      id: id != null ? Value(id) : const Value.absent(),
      itemId: itemId,
      maxCount: maxCount != null ? Value(maxCount) : const Value.absent(),
      minCount: minCount != null ? Value(minCount) : const Value.absent(),
      stockCountChange: Value(stockCountChange ?? 0),
      fixedSuggestion: fixedSuggestion != null
          ? Value(fixedSuggestion)
          : const Value.absent(),
      modified: Value(DateParser.getCurrentUtcDateTime),
      replaceWith:
          replaceWith != null ? Value(replaceWith) : const Value.absent(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (replaceWith.isNotNullOrEmpty) {
      data['item_id'] = itemId;
    }

    if (maxCount != null) {
      data['max_count'] = maxCount;
    }
    if (minCount != null) {
      data['min_count'] = minCount;
    }
    if (stockCountChange != null) {
      data['count_change'] = stockCountChange;
    }

    if (fixedSuggestion != null) {
      data['fixed_suggestion'] = fixedSuggestion;
    }

    return data;
  }
}
