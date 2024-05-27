import 'package:dental_inventory/app/data/local/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/local/auth_local_data_source_imp.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/inventory_local_data_source.dart';
import 'package:dental_inventory/app/data/local/inventory_local_data_source_impl.dart';
import 'package:dental_inventory/app/data/local/product_count_local_data_source.dart';
import 'package:dental_inventory/app/data/local/product_count_local_data_source_impl.dart';
import 'package:dental_inventory/app/data/local/product_in_local_data_source.dart';
import 'package:dental_inventory/app/data/local/product_in_local_data_source_impl.dart';
import 'package:dental_inventory/app/data/local/product_out_local_data_source.dart';
import 'package:dental_inventory/app/data/local/product_out_local_data_source_impl.dart';
import 'package:get/get.dart';

import '/app/data/local/preference/preference_manager.dart';
import '/app/data/local/preference/preference_manager_impl.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceManager>(
      () => PreferenceManagerImpl(),
      fenix: true,
    );
    Get.put(AppDatabase());

    Get.lazyPut<AuthLocalDataSource>(
      () => AuthLocalDataSourceImp(),
      fenix: true,
    );

    Get.lazyPut<InventoryLocalDataSource>(
      () => InventoryLocalDataSourceImpl(),
      fenix: true,
    );

    Get.lazyPut<ProductInLocalDataSource>(
      () => ProductInLocalDataSourceImpl(),
      fenix: true,
    );

    Get.lazyPut<ProductOutLocalDataSource>(
      () => ProductOutLocalDataSourceImpl(),
      fenix: true,
    );

    Get.lazyPut<ProductCountLocalDataSource>(
      () => ProductCountLocalDataSourceImpl(),
      fenix: true,
    );
  }
}
