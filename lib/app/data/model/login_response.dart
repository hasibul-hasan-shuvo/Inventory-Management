class LoginResponse {
  String? token;
  String? refreshToken;
  String? message;
  int? statusCode;

  LoginResponse({
    this.token,
    this.refreshToken,
    this.message,
    this.statusCode,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    Data data = Data.fromJson(json['data']);
    token = data.access;
    refreshToken = data.refresh;
    message = json['message'];
    statusCode = json['code'];
  }
}

class Data {
  String? access;
  String? refresh;

  Data({this.access, this.refresh});

  Data.fromJson(Map<String, dynamic> json) {
    access = json['access'];
    refresh = json['refresh'];
  }
}
