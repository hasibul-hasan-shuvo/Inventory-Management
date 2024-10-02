import 'dart:async';

import 'package:dental_inventory/flavors/build_config.dart';

typedef ScannerDelegate = Function(String? code);
typedef ErrorDelegate = Function(String error);

abstract class Scanner {
  ScannerDelegate? _scannerDelegate;
  ErrorDelegate? _errorDelegate;
  StreamSubscription? scannerSubscription;

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
