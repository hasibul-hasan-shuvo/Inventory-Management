import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/model/login_response.dart';
import 'package:dental_inventory/app/network/end_points/end_points.dart';
import 'package:dio/dio.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImp extends BaseRemoteSource
    implements AuthRemoteDataSource {
  @override
  Future<LoginResponse> login({required LoginRequestBody requestBody}) {
    const endpoint = EndPoints.login;
    var dioCall = dioClient.post(endpoint, data: requestBody.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseLoginResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  LoginResponse _parseLoginResponse(Response response) {
    print(response);

    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse> refreshToken(String refreshToken) {
    const endpoint = EndPoints.refreshToken;
    final data = {'refresh':refreshToken};
    var dioCall = dioClient.post(endpoint, data: data);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseLoginResponse(response));
    } catch (e) {
      rethrow;
    }
  }
}
