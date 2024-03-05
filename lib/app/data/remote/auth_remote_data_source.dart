import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/model/response/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login({required LoginRequestBody requestBody});
  Future<LoginResponse> refreshToken(String refreshToken);
}