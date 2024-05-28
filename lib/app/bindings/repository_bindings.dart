import 'package:dental_inventory/app/data/repository/auth_repository.dart';
import 'package:dental_inventory/app/data/repository/auth_repository_impl.dart';
import 'package:dental_inventory/app/data/repository/home_repository.dart';
import 'package:dental_inventory/app/data/repository/home_repository_impl.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository_impl.dart';
import 'package:dental_inventory/app/data/repository/order_repository.dart';
import 'package:dental_inventory/app/data/repository/order_repository_impl.dart';
import 'package:dental_inventory/app/data/repository/product_count_repository.dart';
import 'package:dental_inventory/app/data/repository/product_count_repository_impl.dart';
import 'package:dental_inventory/app/data/repository/product_in_repository.dart';
import 'package:dental_inventory/app/data/repository/product_in_repository_impl.dart';
import 'package:dental_inventory/app/data/repository/product_out_repository.dart';
import 'package:dental_inventory/app/data/repository/product_out_repository_impl.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository_impl.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository_impl.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<InventoryRepository>(
      () => InventoryRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<SuggestedOrdersRepository>(
      () => SuggestedOrdersRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<ShoppingCartRepository>(
      () => ShoppingCartRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<OrderRepository>(
      () => OrderRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<ProductInRepository>(
      () => ProductInRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<ProductOutRepository>(
      () => ProductOutRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<ProductCountRepository>(
      () => ProductCountRepositoryImpl(),
      fenix: true,
    );
  }
}
