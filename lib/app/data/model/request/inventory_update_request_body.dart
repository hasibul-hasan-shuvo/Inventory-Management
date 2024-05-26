import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:drift/drift.dart';

class InventoryUpdateRequestBody {
  final String inventoryID;
  final String id;
  final int maxCount;
  final int minCount;
  final int stockCount;
  final int stockCountChange;
  final int fixedSuggestion;

  InventoryUpdateRequestBody({
    required this.inventoryID,
    required this.id,
    required this.maxCount,
    required this.minCount,
    required this.stockCount,
    required this.stockCountChange,
    required this.fixedSuggestion,
  });

  String get productID => id;

  InventoryEntityCompanion toInventoryEntityCompanion() {
    return InventoryEntityCompanion(
      maxCount: Value(maxCount),
      minCount: Value(minCount),
      stockCount: Value(stockCount),
      fixedSuggestion: Value(fixedSuggestion),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['inventory'] = inventoryID;
    data['id'] = id;
    data['max_count'] = maxCount;
    data['min_count'] = minCount;
    data['stock_count'] = stockCount;
    data['fixed_suggestion'] = fixedSuggestion;

    return data;
  }
}
