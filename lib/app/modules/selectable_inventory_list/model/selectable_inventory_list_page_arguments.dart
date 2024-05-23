import 'package:dental_inventory/app/core/controllers/scanned_products_controller_mixin.dart';

class SelectableInventoryListPageArguments {
  final ScannedProductsControllerMixin controller;
  final String title;
  final int minAvailableProduct;

  SelectableInventoryListPageArguments({
    required this.controller,
    required this.title,
    this.minAvailableProduct = 0,
  });
}
