import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/model/response/order_items_response.dart';
import 'package:dental_inventory/app/data/repository/order_repository.dart';
import 'package:dental_inventory/app/modules/delivery/models/order_ui_model.dart';
import 'package:get/get.dart';

class DeliveryDetailsController extends BaseController {
  late OrderUiModel order;
  final OrderRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
    order = Get.arguments;
    if (order.items.isEmpty) {
      _getOrderItems();
    }
  }

  void _getOrderItems() {
    callDataService(
      _repository.getOrderItems(order.id),
      onSuccess: _handleOrderItemsSuccessResponse,
    );
  }

  void _handleOrderItemsSuccessResponse(OrderItemsResponse response) {
    order.updateItemsFromOrderItemResponse(response);
  }
}
