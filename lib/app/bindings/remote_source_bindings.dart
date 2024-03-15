import 'package:dental_inventory/app/data/remote/auth_remote_data_source.dart';
import 'package:dental_inventory/app/data/remote/auth_remote_data_source_imp.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dental_inventory/app/data/remote/inventroy_remote_datasource_imp.dart';
import 'package:dental_inventory/app/data/remote/suggested_orders_remote_data_source.dart';
import 'package:dental_inventory/app/data/remote/suggested_orders_remote_data_source_impl.dart';
import 'package:get/get.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
      fenix: true,
    );
    Get.lazyPut<InventoryRemoteDataSource>(
      () => InventoryRemoteDataSourceImp(),
      fenix: true,
    );
    Get.lazyPut<SuggestedOrdersRemoteDataSource>(
      () => SuggestedOrdersRemoteDataSourceImpl(),
      fenix: true,
    );
  }
}
