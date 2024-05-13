import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/preference/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/local/preference/auth_local_data_source_imp.dart';
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
  }
}
