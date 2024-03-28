import 'package:dental_inventory/app/modules/delivery/models/ordered_product_ui_model.dart';

class OrderUiModel {
  late final String id;
  late final String invoiceNo;
  late final String date;
  late final List<OrderedProductUiModel> items;
  late final String status;
  late final String totalPrice;
  late bool isExpanded = false;

  OrderUiModel.dummy(
    String orderStatus,
  ) {
    invoiceNo = "8028202";
    date = "2021-10-10";
    items = [
      OrderedProductUiModel(),
      OrderedProductUiModel(),
      OrderedProductUiModel(),
    ];
    status = orderStatus;
    totalPrice = "1000";
  }
}
