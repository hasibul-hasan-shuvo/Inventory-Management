import 'package:dental_inventory/app/core/controllers/shopping_cart_scanned_products_controller_mixin.dart';

class ShoppingCartSelectableInventoryPageArguments {
  final ShoppingCartScannedProductsControllerMixin controller;
  final String title;
  final bool isIncludeCountInCart;

  ShoppingCartSelectableInventoryPageArguments({
    required this.controller,
    required this.title,
    this.isIncludeCountInCart = false,
  });
}
