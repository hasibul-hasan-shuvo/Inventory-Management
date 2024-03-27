import 'package:dental_inventory/app/data/model/response/inventory_response.dart';

class InventoryCardUIModel {
  late final int id;
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int max;
  late int min;
  late int currentStock;
  late int fixedOrderSuggestions;
  late final double price;

  InventoryCardUIModel.fromInventoryResponse(InventoryResponse response) {
    id = response.id ?? -1;
    itemId = response.product?.itemId ?? '';
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    max = response.maxCount ?? 0;
    min = response.minCount ?? 0;
    currentStock = response.stockCount ?? 0;
    fixedOrderSuggestions = response.fixedSuggestion ?? 0;
    price = response.product?.price ?? 0.0;
  }

  updateFromInventoryResponse(InventoryResponse response) {
    max = response.maxCount ?? 0;
    min = response.minCount ?? 0;
    currentStock = response.stockCount ?? 0;
    fixedOrderSuggestions = response.fixedSuggestion ?? 0;
  }

  void updateCurrentStock(int newStock) {
    currentStock = newStock;
  }
}
