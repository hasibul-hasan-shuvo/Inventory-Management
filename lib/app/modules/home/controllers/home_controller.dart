import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/modules/home/model/item_home_menu_ui_model.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';

class HomeController extends BaseController {
  final RxList<ItemHomeMenuUiModel> _menuListController =
      RxList.empty(growable: true);

  List<ItemHomeMenuUiModel> get menuList => _menuListController;

  @override
  void onInit() {
    super.onInit();
    getHomeMenuItems();
  }

  void getHomeMenuItems() {
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
        route: "",
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.notDelivered,
        title: appLocalization.homeMenuNotDelivered,
        route: "",
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.orderDelivery,
        title: appLocalization.homeMenuOrderDelivery,
        route: "",
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.inventoryCount,
        title: appLocalization.homeMenuInventoryCount,
        route: "",
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.suggestedOrder,
        title: appLocalization.homeMenuSuggestedOrder,
        route: Routes.SUGGESTED_ORDERS,
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.search,
        title: appLocalization.homeMenuSearchItem,
        route: "",
      ),
    );
    list.add(
      ItemHomeMenuUiModel(
        icon: AppIcons.shoppingCart,
        title: appLocalization.homeMenuShoppingCart,
        route: "",
      ),
    );

    _menuListController(list);
  }
}
