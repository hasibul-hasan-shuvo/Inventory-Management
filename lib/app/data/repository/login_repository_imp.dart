import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/local/preference/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/model/login_response.dart';
import 'package:dental_inventory/app/data/remote/auth_remote_data_source.dart';
import 'package:get/get.dart';

import 'login_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource =
      Get.find<AuthRemoteDataSource>();
  final AuthLocalDataSource _localDataSource = Get.find<AuthLocalDataSource>();

  @override
  Future<LoginResponse> login({required LoginRequestBody requestBody}) async {
    return _remoteDataSource.login(requestBody: requestBody).then((data) {
      _localDataSource.storeToken(data.token ?? '');
      _localDataSource.storeToken("2");
      _localDataSource.storeRefreshToken(data.refreshToken ?? "");

      return data;
    });
  }

  @override
  void logout() {
    _localDataSource.removeUserData();
  }

  @override
  Future<bool> refreshToken() async {
    final refreshToken = _localDataSource.getRefreshToken();
    final data = await _remoteDataSource.refreshToken(refreshToken);
    _localDataSource.storeToken(data.token ?? "");
    //TODO
    _localDataSource.storeInventoryID("2");
    _localDataSource.storeRefreshToken(data.refreshToken ?? "");

    return data.token != null;
  }

  @override
  String getAccessToken() {
    return _localDataSource.getToken();
  }

  @override
  String getRefreshToken() {
    return _localDataSource.getRefreshToken();
  }

  @override
  String getInventoryID() {
    return _localDataSource.getInventoryID();
  }
}
