import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/model/login_response.dart';
import 'package:dental_inventory/app/data/model/login_response.dart';
import 'package:dental_inventory/app/modules/login/models/auth_page_state.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  String email = '';
  String password = '';

  final authPageState = AuthPageState.initial().obs;

  void login() {
    final requestBody = LoginRequestBody(
      email: email,
      password: password,
    );
    callDataService(
      authRepository.login(requestBody: requestBody),
      onSuccess: _onLoginSuccess,
      onError: _onLoginError,
    );
  }

  void _onLoginSuccess(LoginResponse data) {
    authPageState.value =
        AuthPageState.success(appLocalization.logInSuccessMessage);
  }

  void _onLoginError(Exception error) {
    authPageState.value =
        AuthPageState.failed(appLocalization.logInErrorMessage);
  }

  void resetAuthPageState() {
    authPageState.value = AuthPageState.initial();
  }
}
