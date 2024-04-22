import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';

class ScannedProductUiModel {
  late final int id;
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int number;
  late final int available;

  ScannedProductUiModel.fromProductResponseModelWithDefaultNumber(
      InventoryResponse response) {
    id = response.id ?? -1;
    itemId = response.product?.itemId ?? '';
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    number = 1;
    available = response.stockCount ?? 0;
  }

  ScannedProductUiModel.fromProductResponseModel(InventoryResponse response) {
    id = response.id ?? -1;
    itemId = response.product?.itemId ?? '';
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    number = response.stockCount ?? 0;
    available = response.stockCount ?? 0;
  }

  void updateNumber(int newNumber) {
    number = newNumber;
  }

  ScannedProductsRequestBody toScannedProductsRequestBodyWithCountChange(
      bool isPositive) {
    return ScannedProductsRequestBody(
      itemId: itemId,
      countChange: isPositive ? number : number * -1,
    );
  }

  ScannedProductsRequestBody toScannedProductsRequestBodyWithCurrentStock() {
    return ScannedProductsRequestBody(
      itemId: itemId,
      currentStock: number,
    );
  }
}
