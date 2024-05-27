import 'package:dental_inventory/app/core/utils/date_parser.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:drift/drift.dart';

class InventoryUpdateRequestBody {
  String? inventoryID;
  int id;
  String itemId;
  int? maxCount;
  int? minCount;
  int? stockCount;
  int? stockCountChange;
  int? fixedSuggestion;

  InventoryUpdateRequestBody({
    required this.id,
    required this.itemId,
    this.inventoryID,
    this.maxCount,
    this.minCount,
    this.stockCount,
    this.stockCountChange,
    this.fixedSuggestion,
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
      id: Value(id),
      itemId: itemId,
      maxCount: maxCount != null ? Value(maxCount!) : const Value.absent(),
      minCount: minCount != null ? Value(minCount!) : const Value.absent(),
      stockCountChange: Value(stockCountChange ?? 0),
      fixedSuggestion: fixedSuggestion != null
          ? Value(fixedSuggestion!)
          : const Value.absent(),
      modified: Value(DateParser.getCurrentUtcDateTime),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;

    if (inventoryID != null) {
      data['inventory'] = inventoryID;
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
