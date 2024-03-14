abstract class AuthLocalDataSource {
  void storeToken(String token);

  void storeInventoryID(String inventoryID);

  void storeRefreshToken(String refreshToken);

  String getToken();

  String getRefreshToken();

  String getInventoryID();

  void removeUserData();
}
