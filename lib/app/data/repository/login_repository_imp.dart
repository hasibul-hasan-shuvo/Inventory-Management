import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/model/login_response.dart';
import 'package:dental_inventory/app/data/remote/login_data_source.dart';
import 'package:get/get.dart';

import 'login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource loginDataSource =  Get.find<LoginDataSource>();

  @override
  Future<LoginResponse> login({required LoginRequestBody requestBody}) {
    return loginDataSource.login(requestBody: requestBody);
  }
}
