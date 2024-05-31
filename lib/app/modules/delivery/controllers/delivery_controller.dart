import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/order_status.dart';
import 'package:dental_inventory/app/data/model/request/order_list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/order_list_response.dart';
import 'package:dental_inventory/app/data/repository/order_repository.dart';
import 'package:dental_inventory/app/modules/delivery/models/order_ui_model.dart';
import 'package:get/get.dart';

class DeliveryController extends BaseController {
  final OrderRepository _repository = Get.find();
  final RxList<OrderUiModel> _orderListController =
      RxList.empty(growable: true);

  List<OrderUiModel> get orderList => _orderListController;

  @override
  void onInit() {
    super.onInit();
    pagingController.initRefresh();
    _getOrders();
  }

  @override
  void onClose() {
    for (var element in _orderListController) {
      element.close();
    }
    _orderListController.close();
    super.onClose();
  }

  void onLoading() {
    if (pagingController.canLoadNextPage()) {
      _getNextOrders();
    }
  }

  void _getOrders() {
    OrderListQueryParams queryParams = OrderListQueryParams(
      page: pagingController.pageNumber,
      status: OrderStatus.DELIVERED.toLowercaseName,
    );

    callDataService(
      _repository.getOrders(
        queryParams,
      ),
      onSuccess: _handleOrdersSuccessResponse,
    );
  }

  void _handleOrdersSuccessResponse(OrderListResponse response) {
    pagingController.nextPage();
    pagingController.isLastPage = response.next == null;
    List<OrderUiModel> list = response.orders
            ?.map(
              (e) => OrderUiModel.fromOrderResponse(
                e,
                appLocalization.localeName,
              ),
            )
            .toList() ??
        [];

    _orderListController(list);
  }

  void _getNextOrders() {
    OrderListQueryParams queryParams = OrderListQueryParams(
      page: pagingController.pageNumber,
      status: OrderStatus.DELIVERED.toLowercaseName,
    );

    callDataService(
      _repository.getOrders(
        queryParams,
      ),
      onSuccess: _handleNextOrdersSuccessResponse,
      onStart: () => logger.d("Fetching more orders"),
      onComplete: () => refreshController.loadComplete(),
    );
  }

  void _handleNextOrdersSuccessResponse(OrderListResponse response) {
    pagingController.nextPage();
    pagingController.isLastPage = response.next == null;
    List<OrderUiModel> list = orderList;
    list.addAll(response.orders
            ?.map(
              (e) => OrderUiModel.fromOrderResponse(
                e,
                appLocalization.localeName,
              ),
            )
            .toList() ??
        []);
  }

  void removeOrder(OrderUiModel data) {
    _orderListController.removeWhere((element) => element.id == data.id);
  }
}
