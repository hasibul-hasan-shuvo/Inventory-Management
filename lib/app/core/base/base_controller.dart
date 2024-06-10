import 'dart:async';

import 'package:dental_inventory/app/core/base/paging_controller.dart';
import 'package:dental_inventory/app/core/model/connection_status.dart';
import 'package:dental_inventory/app/core/services/connectivity_manager.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/data/repository/auth_repository.dart';
import 'package:dental_inventory/app/network/exceptions/duplicate_unique_field_exception.dart';
import 'package:dental_inventory/app/network/exceptions/out_of_stock_exception.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '/app/core/model/page_state.dart';
import '/app/network/exceptions/api_exception.dart';
import '/app/network/exceptions/app_exception.dart';
import '/app/network/exceptions/json_format_exception.dart';
import '/app/network/exceptions/network_exception.dart';
import '/app/network/exceptions/not_found_exception.dart';
import '/app/network/exceptions/service_unavailable_exception.dart';
import '/app/network/exceptions/unauthorize_exception.dart';
import '/flavors/build_config.dart';

abstract class BaseController extends GetxController {
  final Logger logger = BuildConfig.instance.config.logger;

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final AuthRepository authRepository = Get.find();

  final RefreshController refreshController = RefreshController();

  final PagingController pagingController = PagingController();

  final logoutController = false.obs;

  //Reload the page
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  bool get isPageLoading => pageState == PageState.LOADING;

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  final _messageController = ''.obs;

  String get message => _messageController.value;

  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  showErrorMessage(String msg) => _errorMessageController(msg);

  final _successMessageController = ''.obs;

  String get successMessage => _successMessageController.value;

  showSuccessMessage(String msg) => _successMessageController(msg);

  final Rx<ConnectionStatus> _connectionStatusController =
      Rx(ConnectionStatus.NONE);

  ConnectionStatus get connectionStatus => _connectionStatusController.value;
  StreamSubscription? _connectionStreamSubscription;
  Timer? _connectionStatusTimer;

  @override
  void onInit() {
    super.onInit();
    _manageConnectionStatus();
  }

  @override
  void onClose() {
    if (_connectionStatusTimer?.isActive == true) {
      _connectionStatusTimer?.cancel();
    }
    _connectionStreamSubscription?.cancel();
    _connectionStatusController.close();
    _messageController.close();
    _successMessageController.close();
    _errorMessageController.close();
    _refreshController.close();
    _pageSateController.close();
    pagingController.close();
    super.onClose();
  }

  void _manageConnectionStatus() {
    if (!ConnectivityManager().isOnline) {
      _triggerConnectionStatus(ConnectivityManager().isOnline);
    }
    _connectionStreamSubscription =
        ConnectivityManager().connectivityStream.listen((isOnline) {
      _triggerConnectionStatus(isOnline);
    });
  }

  void _triggerConnectionStatus(bool isOnline) {
    _connectionStatusController
        .trigger(isOnline ? ConnectionStatus.ONLINE : ConnectionStatus.OFFLINE);

    if (isOnline) {
      _connectionStatusTimer?.cancel();
      _connectionStatusTimer =
          Timer(const Duration(seconds: AppValues.onlineStatusVisibleTime), () {
        _connectionStatusController.trigger(ConnectionStatus.NONE);
      });
    }
  }

  // ignore: long-parameter-list
  // ignore: long-method
  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
    bool enableErrorMessage = true,
  }) async {
    Exception? _exception;
    String dataServiceErrorMessage = '';

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      dataServiceErrorMessage = exception.message;
    } on UnauthorizedException catch (exception) {
      logout();
      _exception = exception;
      dataServiceErrorMessage = exception.message;
    } on TimeoutException catch (exception) {
      _exception = exception;
      dataServiceErrorMessage = exception.message ?? 'Timeout exception';
    } on NetworkException catch (exception) {
      _exception = exception;
      dataServiceErrorMessage = exception.message;
    } on JsonFormatException catch (exception) {
      _exception = exception;
      dataServiceErrorMessage = exception.message;
    } on NotFoundException catch (exception) {
      _exception = exception;
      dataServiceErrorMessage = exception.message.isEmpty
          ? appLocalization.messageItemNotFound
          : exception.message;
    } on ApiException catch (exception) {
      _exception = exception;
      dataServiceErrorMessage = exception.message;
    } on OutOfStockException catch (exception) {
      _exception = exception;
      dataServiceErrorMessage = appLocalization.messageItemOutOfStock;
    } on DuplicateUniqueFieldException catch (exception) {
      _exception = exception;
      dataServiceErrorMessage = appLocalization.messageInventoryAlreadyExist;
    } on AppException catch (exception) {
      _exception = exception;
      dataServiceErrorMessage = exception.message;
    } catch (error) {
      _exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
      dataServiceErrorMessage = "$error";
    }

    if (dataServiceErrorMessage.isNotEmpty && enableErrorMessage) {
      showErrorMessage(dataServiceErrorMessage);
    }

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();
  }

  void logout() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authRepository.logout();
      if (Get.currentRoute != Routes.LOGIN ||
          Get.currentRoute != Routes.SPLASH) {
        Get.offAllNamed(Routes.SPLASH);
      }
    });
  }

  bool get isDarkMode => Get.isPlatformDarkMode || Get.isDarkMode;
}
