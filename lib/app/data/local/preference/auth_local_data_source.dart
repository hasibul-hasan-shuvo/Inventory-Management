abstract class AuthLocalDataSource {

  storeToken(String token);

  Future<String?> getToken();
}
