import 'package:dental_inventory/app/modules/selectable_inventory_list/bindings/selectable_inventory_list_binding.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/views/selectable_inventory_list_view.dart';
import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/bindings/shopping_cart_selectable_inventories_binding.dart';
import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/views/shopping_carted_selectable_inventories_view.dart';
import 'package:get/get.dart';

import '../modules/about_us/bindings/about_app_binding.dart';
import '../modules/about_us/views/about_app_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/delivery/bindings/delivery_binding.dart';
import '../modules/delivery/views/delivery_view.dart';
import '../modules/delivery_details/bindings/delivery_details_binding.dart';
import '../modules/delivery_details/views/delivery_details_view.dart';
import '../modules/global_inventories/bindings/global_inventories_binding.dart';
import '../modules/global_inventories/views/global_inventories_view.dart';
import '../modules/inventory/bindings/inventory_binding.dart';
import '../modules/inventory/views/inventory_view.dart';
import '../modules/item_count/bindings/item_count_binding.dart';
import '../modules/item_count/views/item_count_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/not_delivery/bindings/not_delivery_binding.dart';
import '../modules/not_delivery/views/not_delivery_view.dart';
import '../modules/product_in/bindings/product_in_binding.dart';
import '../modules/product_in/views/product_in_view.dart';
import '../modules/product_out/bindings/product_out_binding.dart';
import '../modules/product_out/views/product_out_view.dart';
import '../modules/scanner/bindings/scanner_binding.dart';
import '../modules/scanner/views/scanner_view.dart';
import '../modules/shopping_cart/bindings/shopping_cart_binding.dart';
import '../modules/shopping_cart/views/shopping_cart_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/suggested_orders/bindings/suggested_orders_binding.dart';
import '../modules/suggested_orders/views/suggested_orders_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_APP,
      page: () => AboutAppView(),
      binding: AboutAppBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INVENTORY,
      page: () => InventoryView(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SUGGESTED_ORDERS,
      page: () => SuggestedOrdersView(),
      binding: SuggestedOrdersBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY,
      page: () => DeliveryView(),
      binding: DeliveryBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_DETAILS,
      page: () => DeliveryDetailsView(),
      binding: DeliveryDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NOT_DELIVERY,
      page: () => NotDeliveryView(),
      binding: NotDeliveryBinding(),
    ),
    GetPage(
      name: _Paths.SHOPPING_CART,
      page: () => ShoppingCartView(),
      binding: ShoppingCartBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER,
      page: () => ScannerView(),
      binding: ScannerBinding(),
    ),
    GetPage(
      name: _Paths.SELECTABLE_INVENTORY_LIST,
      page: () => SelectableInventoryListView(),
      binding: SelectableInventoryListBinding(),
    ),
    GetPage(
      name: _Paths.SHOPPING_CART_SELECTABLE_INVENTORIES,
      page: () => ShoppingCartSelectableInventoriesView(),
      binding: ShoppingCartSelectableInventoriesBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_OUT,
      page: () => ProductOutView(),
      binding: ProductOutBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_IN,
      page: () => ProductInView(),
      binding: ProductInBinding(),
    ),
    GetPage(
      name: _Paths.ITEM_COUNT,
      page: () => ItemCountView(),
      binding: ItemCountBinding(),
    ),
    GetPage(
      name: _Paths.GLOBAL_INVENTORIES,
      page: () => GlobalInventoriesView(),
      binding: GlobalInventoriesBinding(),
    ),
  ];
}
