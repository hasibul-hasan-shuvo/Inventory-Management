import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/local/preference/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/model/response/login_response.dart';
import 'package:dental_inventory/app/data/remote/auth_remote_data_source.dart';
import 'package:get/get.dart';

import 'login_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource loginDataSource = Get.find<AuthRemoteDataSource>();
  final AuthLocalDataSource authLocalDataSource =
      Get.find<AuthLocalDataSource>();

  @override
  Future<LoginResponse> login({required LoginRequestBody requestBody}) async {
    final data = await loginDataSource.login(requestBody: requestBody);
    authLocalDataSource.storeToken(data.token ?? "");
    authLocalDataSource.storeInventoryID("2");
    authLocalDataSource.storeRefreshToken(data.refreshToken ?? "");

    return data;
  }

  @override
  Future<bool> refreshToken() async {
    final refreshToken = authLocalDataSource.getRefreshToken();
    final data = await loginDataSource.refreshToken(refreshToken);
    authLocalDataSource.storeToken(data.token ?? "");
    //TODO
    authLocalDataSource.storeInventoryID("2");
    authLocalDataSource.storeRefreshToken(data.refreshToken ?? "");

    return data.token != null;
  }

  @override
  String getAccessToken() {
    return authLocalDataSource.getToken();
  }

  @override
  String getRefreshToken() {
    return authLocalDataSource.getRefreshToken();
  }

  @override
  String getInventoryID() {
    return authLocalDataSource.getInventoryID();
  }
}
