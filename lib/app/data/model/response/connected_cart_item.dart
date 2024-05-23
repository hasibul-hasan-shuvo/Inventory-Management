import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';

class ConnectedCartItemUiModel {
  late int id;
  late int quantity;

  ConnectedCartItemUiModel.fromConnectedCartItemResponse(
      ConnectedCartItemResponse? response) {
    id = response?.id ?? -1;
    quantity = response?.quantity ?? 0;
  }

  ConnectedCartItemUiModel.fromShoppingCartResponse(
      ShoppingCartResponse response) {
    id = response.id ?? -1;
    quantity = response.quantity ?? 0;
  }

  ConnectedCartItemUiModel.empty() {
    id = -1;
    quantity = 0;
  }

  bool isCartedItem() {
    return id != -1;
  }
}
