import 'package:dental_inventory/app/data/remote/login_data_source.dart';
import 'package:dental_inventory/app/data/remote/login_data_source_imp.dart';
import 'package:get/get.dart';

import '/app/data/remote/github_remote_data_source.dart';
import '/app/data/remote/github_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GithubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl(),
      tag: (GithubRemoteDataSource).toString(),
    );
    Get.lazyPut<LoginDataSource>(
      () => LoginDataSourceImp(),
    );
  }
}
