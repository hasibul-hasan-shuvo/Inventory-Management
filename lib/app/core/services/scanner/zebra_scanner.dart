import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dental_inventory/app/core/services/scanner/scanner.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:flutter/services.dart';

class ZebraScanner implements Scanner {
  ScannerDelegate? _scannerDelegate;
  ErrorDelegate? _errorDelegate;
  StreamSubscription? scannerSubscription;

  static const EventChannel scanChannel =
      EventChannel('inventorymanagement.no/scan');

  ZebraScanner() {
    if (Platform.isAndroid) {
      scannerSubscription = scanChannel.receiveBroadcastStream().listen(
            _onEvent,
            onError: _onError,
          );
    }
  }

  void _onEvent(event) {
    Map data = jsonDecode(event);
    String? barcode = data['data'];
    BuildConfig.instance.config.logger.d("BarcodeString: $barcode");
    _scannerDelegate?.call(barcode);
  }

  void _onError(Object error) {
    BuildConfig.instance.config.logger.d("BarcodeError: $error");
    _errorDelegate?.call(error);
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
}
