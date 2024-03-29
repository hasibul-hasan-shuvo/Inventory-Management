import 'package:dental_inventory/app/core/utils/date_parser.dart';
import 'package:dental_inventory/app/data/model/response/order_list_response.dart';
import 'package:dental_inventory/app/modules/delivery/models/ordered_product_ui_model.dart';

class OrderUiModel {
  late final int id;
  late final String invoiceNo;
  late final String date;
  late final List<OrderedProductUiModel> items;
  late final String status;
  bool isExpanded = false;

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
  }

  OrderUiModel.fromOrderResponse(OrderResponse response, String localName) {
    id = response.id ?? 0;
    invoiceNo = response.invoice ?? '';
    date = DateParser.getDateString(
      timestamp: response.orderDate,
      outputDateFormat: DateParser.defaultDateFormat,
      localeName: localName,
    );
    items = [];
    status = '';
  }
}
