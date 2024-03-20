import 'package:dental_inventory/app/data/repository/auth_repository.dart';
import 'package:dental_inventory/app/data/repository/auth_repository_impl.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository_imp.dart';
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
      () => InventoryRepositoryImp(),
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
  }
}
