import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';

class SelectableInventoryItemUiModel {
  late final int id;
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int number;
  late final int available;

  SelectableInventoryItemUiModel.fromProductResponseModel(
      InventoryResponse response) {
    id = response.id ?? -1;
    itemId = response.product?.itemId ?? '';
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    number = 0;
    available = response.stockCount ?? 0;
  }

  updateFromInventoryResponse(InventoryResponse response) {}

  void updateNumber(int newNumber) {
    number = newNumber;
  }

  ScannedProductsRequestBody toScannedProductsRequestBody(bool isPositive) {
    return ScannedProductsRequestBody(
        itemId: itemId, countChange: isPositive ? number : number * -1);
  }
}
