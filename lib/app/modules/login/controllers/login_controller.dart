import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/model/response/login_response.dart';
import 'package:dental_inventory/app/data/repository/login_repository.dart';
import 'package:dental_inventory/app/modules/login/models/auth_page_state.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final AuthRepository _loginRepository = Get.find<AuthRepository>();
  String email = '';
  String password = '';

  final authPageState = AuthPageState.initial().obs;

  Future<void> login() async {
    final requestBody = LoginRequestBody(
      email: email,
      password: password,
    );
    callDataService(
      _loginRepository.login(requestBody: requestBody),
      onSuccess: loginOnSuccess,
      onError: loginOnError,
    );
  }

  void loginOnError(Exception error) {
    authPageState.value =
        AuthPageState.failed(appLocalization.logInErrorMessage);
  }

  void loginOnSuccess(LoginResponse data) {
    authPageState.value =
        AuthPageState.success(appLocalization.logInSuccessMessage);
  }

  void resetAuthPageState() {
    authPageState.value = AuthPageState.initial();
  }
}
