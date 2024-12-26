import 'dart:async';
import 'dart:io';

import 'package:dental_inventory/flavors/build_config.dart';
import 'package:device_info_plus/device_info_plus.dart';

typedef ScannerDelegate = Function(String? code);
typedef ErrorDelegate = Function(String error);

abstract class Scanner {
  ScannerDelegate? _scannerDelegate;
  ErrorDelegate? _errorDelegate;
  StreamSubscription? scannerSubscription;

  String get manufacturer;

  Future<bool> get isSupported {
    if (Platform.isIOS) {
      return Future.value(false);
    } else {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

      return deviceInfoPlugin.androidInfo.then((deviceInfo) {
        return deviceInfo.manufacturer.contains(manufacturer);
      }).catchError((error, stackTrace) => false);
    }
  }

  void addErrorDelegate(ErrorDelegate delegate) {
    _errorDelegate = delegate;
  }

  void addScannerDelegate(ScannerDelegate delegate) {
    _scannerDelegate = delegate;
  }

  void close() {
    BuildConfig.instance.config.logger.i("ScannerDelegatesClosed");
    _scannerDelegate = null;
    _errorDelegate = null;
  }

  void dismiss() {
    scannerSubscription?.cancel();
  }

  void publishScannedCode(String? scannedCode) {
    _scannerDelegate?.call(scannedCode);
  }

  void publishError(String? error) {
    _errorDelegate?.call(error ?? "Code not found");
  }
}
