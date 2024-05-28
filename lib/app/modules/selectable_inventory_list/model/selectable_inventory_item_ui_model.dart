import 'dart:convert';

import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/connected_cart_item.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_response.dart';

class SelectableInventoryItemUiModel {
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late int number;
  late final int available;
  late ConnectedCartItemUiModel connectedCartItem;

  SelectableInventoryItemUiModel.fromInventoryEntityData(
      InventoryEntityData data) {
    ProductResponse product =
        ProductResponse.fromJson(jsonDecode(data.product));

    itemId = product.itemId ?? '';
    name = product.name ?? '';
    imageUrl = product.imageUrl ?? '';
    number = 0;
    available = data.stockCount;
  }

  SelectableInventoryItemUiModel.fromShoppingProductResponseModel(
      InventoryResponse response) {
    itemId = response.product?.itemId ?? '';
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    number = 0;
    available = response.stockCount ?? 0;
    connectedCartItem = ConnectedCartItemUiModel.fromConnectedCartItemResponse(
      response.connectedCartItem,
    );
  }

  void updateNumber(int newNumber) {
    number = newNumber;
  }

  void addCartItem(ConnectedCartItemUiModel newCartedItem) {
    connectedCartItem = newCartedItem;
  }

  void updateCartItem(int newQuantity) {
    connectedCartItem.quantity = newQuantity;
  }

  void deleteCartItem() {
    connectedCartItem = ConnectedCartItemUiModel.empty();
  }

  ScannedProductsRequestBody toScannedProductsRequestBody(bool isPositive) {
    return ScannedProductsRequestBody(
      itemId: itemId,
      countChange: isPositive ? number : number * -1,
    );
  }
}
