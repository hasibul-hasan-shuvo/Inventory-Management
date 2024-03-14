abstract class AuthLocalDataSource {
  void storeToken(String token);

  String getToken();

  void removeUserData();
}
