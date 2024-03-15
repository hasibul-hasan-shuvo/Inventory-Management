class LoginResponse {
  String? access;
  String? refresh;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    access = json['access'];
    refresh = json['refresh'];
  }
}
