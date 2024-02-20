import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/local/preference/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/model/login_response.dart';
import 'package:dental_inventory/app/data/remote/auth_remote_data_source.dart';
import 'package:get/get.dart';

import 'login_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource loginDataSource =
      Get.find<AuthRemoteDataSource>();
  final AuthLocalDataSource authLocalDataSource =
      Get.find<AuthLocalDataSource>();

  @override
  Future<LoginResponse> login({required LoginRequestBody requestBody}) async {
    final data = await loginDataSource.login(requestBody: requestBody);
    authLocalDataSource.storeToken(data.token ?? "");

    return data;
  }
}
