abstract class AuthLocalDataSource {
  storeToken(String token);

  storeRefreshToken(String refreshToken);

  Future<String> getToken();

  Future<String> getRefreshToken();
}
