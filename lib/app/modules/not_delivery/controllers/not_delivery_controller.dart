import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/modules/delivery/models/order_ui_model.dart';
import 'package:get/get.dart';

class NotDeliveryController extends BaseController {
  final RxList<OrderUiModel> orderList = <OrderUiModel>[].obs;

  @override
  onInit() {
    super.onInit();
    _makeOrderList();
  }

  _makeOrderList() {
    for (var i = 0; i < 9; i++) {
      orderList.add(OrderUiModel.dummy(i % 2 == 0 ? "Pending" : "Delivered"));
    }
  }

  void toggleExpandStatus(int index) {
    orderList[index].isExpanded = !orderList[index].isExpanded;
    orderList.refresh();
  }
}
