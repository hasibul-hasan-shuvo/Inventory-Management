import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository_imp.dart';
import 'package:dental_inventory/app/data/repository/login_repository.dart';
import 'package:dental_inventory/app/data/repository/login_repository_imp.dart';
import 'package:get/get.dart';

import '/app/data/repository/github_repository.dart';
import '/app/data/repository/github_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GithubRepository>(() => GithubRepositoryImpl(),
        tag: (GithubRepository).toString(), fenix: true);
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImp(), fenix: true);

    Get.lazyPut<InventoryRepository>(() => InventoryRepositoryImp(),
        fenix: true);
  }
}
