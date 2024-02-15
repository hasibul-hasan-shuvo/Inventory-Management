import 'package:dental_inventory/app/data/model/login_response.dart';

import '../../core/model/login_request_body.dart';

abstract class LoginRepository {
  Future<LoginResponse> login({required LoginRequestBody requestBody});
}
