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
  final RxList<OrderedProductUiModel> _itemsController =
      RxList.empty(growable: true);

  List<OrderedProductUiModel> get items => _itemsController;
  late final OrderStatus status;
  final RxBool _isExpandedController = RxBool(false);

  bool get isExpanded => _isExpandedController.value;

  OrderUiModel.fromOrderResponse(OrderResponse response, String localName) {
    id = response.id ?? 0;
    invoiceNo = response.invoice ?? '';
    date = DateParser.getDateString(
      timestamp: response.orderDate,
      outputDateFormat: DateParser.defaultDateFormat,
      localeName: localName,
    );
    status = OrderStatus.values.firstWhereOrNull(
          (element) => element.name.toLowerCase() == response.status,
        ) ??
        OrderStatus.DELIVERED;
  }

  void updateItemsFromOrderItemResponse(OrderItemsResponse response) {
    _itemsController(response.items
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
        []);
  }

  void toggleExpandedStatus() {
    _isExpandedController(!isExpanded);
  }
}
