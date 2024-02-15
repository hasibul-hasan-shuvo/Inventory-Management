import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/model/login_request_body.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:dental_inventory/app/data/repository/login_repository.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final LoginRepository _loginRepository = Get.find<LoginRepository>();
  final PreferenceManager _preferenceManager = Get.find<PreferenceManager>();
  String email = '';
  String password = '';
  RxString token = ''.obs;
  RxString refreshToken = ''.obs;

  Future<void> login() async {
    final requestBody = LoginRequestBody(
      email: email,
      password: password,
    );
    callDataService(
      _loginRepository.login(requestBody: requestBody),
      onSuccess: (data) {
        _preferenceManager.storeToken(data.token ?? '');
        token.value = data.token ?? '';
      },
    );
  }
}
