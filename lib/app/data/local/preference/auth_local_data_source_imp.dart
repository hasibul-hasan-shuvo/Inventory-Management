import 'package:dental_inventory/app/core/values/app_keys.dart';
import 'package:dental_inventory/app/data/local/preference/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:get/get.dart';

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final PreferenceManager _preferenceManager = Get.find<PreferenceManager>();

  @override
  void storeToken(String token) {
    return _preferenceManager.setString(AppKeys.TOKEN, token);
  }

  @override
  String getToken() {
    return _preferenceManager.getString(AppKeys.TOKEN);
  }

  @override
  void removeUserData() {
    _preferenceManager.remove(AppKeys.TOKEN);
  }
}
