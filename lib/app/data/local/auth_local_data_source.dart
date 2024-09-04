import 'package:dental_inventory/app/data/model/response/user_response.dart';

abstract class AuthLocalDataSource {
  void storeToken(String token);

  void storeRefreshToken(String refreshToken);

  String getToken();

  String getRefreshToken();

  int getInventoryID();

  void storeUserData(UserResponse data);

  UserResponse getUserData();

  void removeUserData();

  bool getIsUserAccountSet();

  void setIsUserAccountSet();
}
