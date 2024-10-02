import 'dart:async';

import 'package:dental_inventory/app/core/services/scanner/scanner.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:laser_scanner/laser_scanner.dart';
import 'package:laser_scanner/model/scan_result_model.dart';
import 'package:logger/logger.dart';

class UrovoScanner extends Scanner {
  ScannerDelegate? _scannerDelegate;
  ErrorDelegate? _errorDelegate;
  StreamSubscription? scannerSubscription;

  UrovoScanner() {
    _initUrovoScanner();
  }

  @override
  void addErrorDelegate(ErrorDelegate delegate) {
    _errorDelegate = delegate;
  }

  @override
  void addScannerDelegate(ScannerDelegate delegate) {
    _scannerDelegate = delegate;
  }

  @override
  void close() {
    BuildConfig.instance.config.logger.i("ScannerDelegatesClosed");
    _scannerDelegate = null;
    _errorDelegate = null;
  }

  @override
  void dismiss() {
    scannerSubscription?.cancel();
  }

  void _initUrovoScanner() {
    Logger().d("Urovo setup");
    LaserScanner().onListenerScanner(
      onListenerResultScanner: _onListenerResultScanner,
    );
  }

  void _onListenerResultScanner(ScanResultModel? result) {
    if (result == null) {
      _errorDelegate?.call('Code not found');

      return;
    }
    String? barcode = result.barcode;
    BuildConfig.instance.config.logger.d("UrovoBarcodeString: $barcode");
    _scannerDelegate?.call(barcode);
  }
}
