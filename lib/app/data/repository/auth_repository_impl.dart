import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/local/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/model/response/login_response.dart';
import 'package:dental_inventory/app/data/model/response/user_response.dart';
import 'package:dental_inventory/app/data/remote/auth_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/product_count_repository.dart';
import 'package:dental_inventory/app/data/repository/product_in_repository.dart';
import 'package:dental_inventory/app/data/repository/product_out_repository.dart';
import 'package:get/get.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource =
      Get.find<AuthRemoteDataSource>();
  final AuthLocalDataSource _localDataSource = Get.find<AuthLocalDataSource>();
  final InventoryRepository _inventoryRepository = Get.find();
  final ProductInRepository _productInRepository = Get.find();
  final ProductOutRepository _productOutRepository = Get.find();
  final ProductCountRepository _productCountRepository = Get.find();

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
    _inventoryRepository.deleteAllInventories();
    _inventoryRepository.deleteAllInventoryChanges();
    _productInRepository.deleteProducts();
    _productOutRepository.deleteProducts();
    _productCountRepository.deleteProducts();
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

  @override
  bool getIsUserAccountSet() {
    return _localDataSource.getIsUserAccountSet();
  }

  @override
  void setIsUserAccountSet() {
    return _localDataSource.setIsUserAccountSet();
  }

  Future<UserResponse> _getAndSaveUserData() {
    return _remoteDataSource.getUserData().then((response) {
      _localDataSource.storeUserData(response);

      return response;
    });
  }

  @override
  UserResponse getUserData() {
    return _localDataSource.getUserData();
  }
}
