import 'package:dental_inventory/app/data/repository/login_repository.dart';
import 'package:dental_inventory/app/network/dio_provider.dart';
import 'package:dental_inventory/app/network/end_points/end_points.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  final AuthRepository _repository = Get.find();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      print("OnRequest");
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    var customHeaders = {'content-type': 'application/json'};

    String accessToken = await _repository.getAccessToken();

    if (accessToken.isNotEmpty) {
      customHeaders['Authorization'] = 'Bearer $accessToken';
      customHeaders['InventoryID'] = '2';
    }

    return customHeaders;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      String refreshToken = await _repository.getAccessToken();
      if (err.requestOptions.path.contains(EndPoints.refreshToken)) {
        super.onError(err, handler);
      } else if (refreshToken.isNotEmpty) {
        try {
          bool isSuccess = await _repository.refreshToken();

          if (isSuccess) {
            return handler.resolve(
              await DioProvider.dioWithHeaderToken.fetch(err.requestOptions),
            );
          }
        } catch (e) {
          BuildConfig.instance.config.logger.e("TokenRefreshException: $e");
        }
      }
    }
    super.onError(err, handler);
  }
}
