import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';

class ScannedProductUiModel {
  late final int id;
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int number;
  late final int available;

  ScannedProductUiModel({
    required this.id,
    required this.itemId,
    required this.name,
    required this.imageUrl,
    required this.number,
    required this.available,
  });

  ScannedProductUiModel.fromProductResponseModel(InventoryResponse response) {
    id = response.id ?? -1;
    itemId = response.product?.itemId ?? '';
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    number = 1;
    available = response.stockCount ?? 0;
  }

  ScannedProductUiModel.addProductFromInventory(
      SelectableInventoryItemUiModel data) {
    id = data.id;
    itemId = data.itemId;
    name = data.name;
    imageUrl = data.imageUrl;
    number = data.number + 1;
    available = data.available;
  }

  void updateNumber(int newNumber) {
    number = newNumber;
  }

  ScannedProductsRequestBody toScannedProductsRequestBody(bool isPositive) {
    return ScannedProductsRequestBody(
      itemId: itemId,
      countChange: isPositive ? number : number * -1,
    );
  }
}
