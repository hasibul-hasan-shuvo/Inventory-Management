import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/local/preference/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/model/response/login_response.dart';
import 'package:dental_inventory/app/data/model/response/user_response.dart';
import 'package:dental_inventory/app/data/remote/auth_remote_data_source.dart';
import 'package:get/get.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource =
      Get.find<AuthRemoteDataSource>();
  final AuthLocalDataSource _localDataSource = Get.find<AuthLocalDataSource>();

  @override
  Future<LoginResponse> login({required LoginRequestBody requestBody}) {
    return _remoteDataSource
        .login(requestBody: requestBody)
        .then((response) async {
      _localDataSource.storeToken(response.access ?? '');
      _localDataSource.storeRefreshToken(response.refresh ?? "");

      await _getAndSaveUserData();

      return response;
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
    _localDataSource.storeToken(data.access ?? "");
    _localDataSource.storeRefreshToken(data.refresh ?? "");

    return data.refresh != null;
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
    return _localDataSource.getInventoryID().toString();
  }

  Future<UserResponse> _getAndSaveUserData() {
    return _remoteDataSource.getUserData().then((response) {
      _localDataSource.storeUserData(response);

      return response;
    });
  }
}
