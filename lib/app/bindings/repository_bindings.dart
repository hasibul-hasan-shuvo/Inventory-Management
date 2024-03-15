import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository_imp.dart';
import 'package:dental_inventory/app/data/repository/login_repository.dart';
import 'package:dental_inventory/app/data/repository/login_repository_imp.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository_impl.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImp(),
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
  }
}
