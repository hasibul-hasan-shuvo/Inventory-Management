import 'dart:convert';

import 'package:dental_inventory/app/data/local/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:dental_inventory/app/data/model/response/user_response.dart';
import 'package:get/get.dart';

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final PreferenceManager _preferenceManager = Get.find<PreferenceManager>();

  @override
  void storeToken(String token) {
    return _preferenceManager.setString(PreferenceManager.KEY_TOKEN, token);
  }

  @override
  String getToken() {
    return _preferenceManager.getString(PreferenceManager.KEY_TOKEN);
  }

  @override
  String getRefreshToken() {
    return _preferenceManager.getString(PreferenceManager.REFRESH_TOKEN);
  }

  @override
  void storeRefreshToken(String refreshToken) {
    return _preferenceManager.setString(
        PreferenceManager.REFRESH_TOKEN, refreshToken);
  }

  @override
  int getInventoryID() {
    return _preferenceManager.getInt(PreferenceManager.INVENTORY_ID);
  }

  @override
  void storeUserData(UserResponse data) {
    String userDataString = jsonEncode(data.toJson());
    _preferenceManager.setInt(
        PreferenceManager.INVENTORY_ID, data.inventoryId ?? -1);
    _preferenceManager.setString(PreferenceManager.USER_DATA, userDataString);
  }

  @override
  UserResponse getUserData() {
    String userDataString = _preferenceManager
        .getString(PreferenceManager.USER_DATA, defaultValue: '{}');

    return UserResponse.fromJson(jsonDecode(userDataString));
  }

  @override
  void removeUserData() {
    _preferenceManager.remove(PreferenceManager.INVENTORY_LAST_SYNC_TIME_STAMP);
    _preferenceManager
        .remove(PreferenceManager.SHOPPING_CART_LAST_SYNC_TIME_STAMP);
    _preferenceManager.remove(PreferenceManager.KEY_TOKEN);
    _preferenceManager.remove(PreferenceManager.REFRESH_TOKEN);
    _preferenceManager.remove(PreferenceManager.INVENTORY_ID);
    _preferenceManager.remove(PreferenceManager.USER_DATA);
    _preferenceManager.remove(PreferenceManager.IS_USER_ACCOUNT_SET);
  }

  @override
  bool getIsUserAccountSet() {
    return _preferenceManager.getBool(PreferenceManager.IS_USER_ACCOUNT_SET);
  }

  @override
  void setIsUserAccountSet() {
    return _preferenceManager.setBool(
      PreferenceManager.IS_USER_ACCOUNT_SET,
      true,
    );
  }
}
