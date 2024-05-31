import 'dart:async';

import 'package:dental_inventory/app/core/services/offline_service/data_sync_manager.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/data/model/response/home_counters_response.dart';
import 'package:dental_inventory/app/data/repository/home_repository.dart';
import 'package:dental_inventory/app/modules/main/model/item_home_menu_ui_model.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';

class MainController extends BaseController {
  final HomeRepository _repository = Get.find();

  final RxList<ItemHomeMenuUiModel> _menuListController =
      RxList.empty(growable: true);

  List<ItemHomeMenuUiModel> get menuList => _menuListController;

  final RxMap<String, int?> _badgesController = RxMap();

  Map<String, int?> get badges => _badgesController;

  StreamSubscription? _dataSyncStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    _getHomeMenuItems();
    getCounters();
    _subscribeDataSyncStream();
  }

  @override
  void onClose() {
    _dataSyncStreamSubscription?.cancel();
    _menuListController.close();
    _badgesController.close();
    super.onClose();
  }

  void _subscribeDataSyncStream() {
    _dataSyncStreamSubscription =
        DataSyncManager().isDataSynced.listen((isSynced) {
      if (isSynced) {
        refreshController.refreshCompleted();
      }
    });
  }

  void onRefresh() {
    DataSyncManager().syncAllDataWithServer();
    getCounters();
  }

  // ignore: long-method
  void _getHomeMenuItems() {
    List<ItemHomeMenuUiModel> list = List.empty(growable: true);
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.inventory,
        title: appLocalization.homeMenuInventory,
        route: Routes.INVENTORY,
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.returnInventory,
        title: appLocalization.homeMenuRevertItemRetrieved,
        route: Routes.PRODUCT_IN,
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.notDelivered,
        title: appLocalization.homeMenuNotDelivered,
        route: Routes.NOT_DELIVERY,
        badgeKey: 'active_orders',
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.orderDelivery,
        title: appLocalization.homeMenuOrderDelivery,
        route: Routes.DELIVERY,
        badgeKey: 'completed_orders',
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.inventoryCount,
        title: appLocalization.homeMenuInventoryCount,
        route: Routes.ITEM_COUNT,
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.suggestedOrder,
        title: appLocalization.homeMenuSuggestedOrder,
        route: Routes.SUGGESTED_ORDERS,
        badgeKey: 'suggested_order_items',
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.search,
        title: appLocalization.homeMenuSearchItem,
        route: Routes.GLOBAL_INVENTORIES,
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.shoppingCart,
        title: appLocalization.homeMenuShoppingCart,
        route: Routes.SHOPPING_CART,
        badgeKey: 'active_cart_items',
      ),
    );

    _menuListController(list);
  }

  void getCounters() {
    callDataService(
      _repository.getHomeMenuCounters(),
      onSuccess: _handleHomeCountersSuccessResponse,
      enableErrorMessage: false,
      onStart: () => logger.d("Fetching home counters"),
      onComplete: () => logger.d("Fetched home counters"),
    );
  }

  void _handleHomeCountersSuccessResponse(HomeCountersResponse response) {
    _badgesController(response.toJson());
  }
}
