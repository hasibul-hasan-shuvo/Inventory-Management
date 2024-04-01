import 'package:dental_inventory/app/core/utils/date_parser.dart';
import 'package:dental_inventory/app/core/values/order_status.dart';
import 'package:dental_inventory/app/data/model/response/order_items_response.dart';
import 'package:dental_inventory/app/data/model/response/order_list_response.dart';
import 'package:dental_inventory/app/modules/delivery/models/ordered_product_ui_model.dart';
import 'package:get/get.dart';

class OrderUiModel {
  late final int id;
  late final String invoiceNo;
  late final String date;
  late List<OrderedProductUiModel> items;
  late final OrderStatus status;
  bool isExpanded = false;

  OrderUiModel.fromOrderResponse(OrderResponse response, String localName) {
    id = response.id ?? 0;
    invoiceNo = response.invoice ?? '';
    date = DateParser.getDateString(
      timestamp: response.orderDate,
      outputDateFormat: DateParser.defaultDateFormat,
      localeName: localName,
    );
    items = [];
    status = OrderStatus.values.firstWhereOrNull(
          (element) => element.name.toLowerCase() == response.status,
        ) ??
        OrderStatus.ORDERED;
  }

  void updateItemsFromOrderItemResponse(OrderItemsResponse response) {
    items = response.items
            ?.map(
              (e) => OrderedProductUiModel(
                id: e.product?.id ?? -1,
                itemId: e.product?.itemId ?? '',
                name: e.product?.name ?? '',
                quantity: e.quantity ?? 0,
                price: e.product?.price ?? 0.0,
                imageUrl: e.product?.imageUrl ?? '',
              ),
            )
            .toList() ??
        [];
  }
}
