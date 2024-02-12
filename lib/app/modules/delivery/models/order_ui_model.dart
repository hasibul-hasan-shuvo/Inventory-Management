import 'package:dental_inventory/app/modules/delivery/models/product_model.dart';
import 'package:get/get.dart';

class OrderUiModel {
  late final int id;
  late final String date;
  late final List<ProductModel> items;
  late final String status;
  late final String totalPrice;
  late RxBool isExpanded = false.obs;

  OrderUiModel.dummy() {
    id = 8028202;
     date = "2021-10-10";
    items = [
      ProductModel(),
      ProductModel(),
      ProductModel(),
    ];
    status = "Not Delivered";
    totalPrice = "1000";
  }
}
