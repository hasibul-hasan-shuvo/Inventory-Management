import 'package:dental_inventory/app/data/model/response/login_response.dart';

import '../../core/model/login_request_body.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({required LoginRequestBody requestBody});

  Future<bool> refreshToken();

  String getAccessToken();

  String getRefreshToken();

  String getInventoryID();

  bool getIsUserAccountSet();

  void setIsUserAccountSet();

  void logout();
}
