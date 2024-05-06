import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/connected_cart_tem.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';

class SelectableInventoryItemUiModel {
  late final int id;
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int number;
  late final int available;
  late ConnectedCartItem? connectedCartItem;

  SelectableInventoryItemUiModel.fromProductResponseModel(
      InventoryResponse response) {
    id = response.id ?? -1;
    itemId = response.product?.itemId ?? '';
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    number = 0;
    available = response.stockCount ?? 0;
  }

  SelectableInventoryItemUiModel.fromShoppingProductResponseModel(
      InventoryResponse response) {
    id = response.id ?? -1;
    itemId = response.product?.itemId ?? '';
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    number = 0;
    available = response.stockCount ?? 0;
    connectedCartItem = response.connectedCartItem;
  }

  void updateNumber(int newNumber) {
    number = newNumber;
  }

  void addCartItem(ConnectedCartItem newCartedItem) {
    connectedCartItem = newCartedItem;
  }

  void updateCartItem(int newQuantity) {
    connectedCartItem!.quantity = newQuantity;
  }

  void deleteCartItem() {
    connectedCartItem = null;
  }

  ScannedProductsRequestBody toScannedProductsRequestBody(bool isPositive) {
    return ScannedProductsRequestBody(
      itemId: itemId,
      countChange: isPositive ? number : number * -1,
    );
  }
}
