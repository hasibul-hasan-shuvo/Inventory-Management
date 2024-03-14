import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/modules/delivery/models/order_ui_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DeliveryController extends BaseController {
  final RxList<OrderUiModel> orderList = <OrderUiModel>[].obs;

  @override
  onInit() {
    super.onInit();
    _makeOrderList();
  }

  _makeOrderList() {
    for (var i = 0; i < 9; i++) {
      i%2==0?orderList.add(OrderUiModel.dummy('Pending')):orderList.add(OrderUiModel.dummy('Delivered'));
    }
  }
}
