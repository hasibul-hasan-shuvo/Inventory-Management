import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dental_inventory/flavors/build_config.dart';
import 'package:flutter/services.dart';

typedef ScannerDelegate = Function(String? code);
typedef ErrorDelegate = Function(Object error);

class ZebraScanner {
  static final ZebraScanner _instance = ZebraScanner._internal();
  ScannerDelegate? _scannerDelegate;
  ErrorDelegate? _errorDelegate;
  StreamSubscription? scannerSubscription;

  static const EventChannel scanChannel =
      EventChannel('inventorymanagement.no/scan');

  factory ZebraScanner() {
    return _instance;
  }

  void addScannerDelegate(ScannerDelegate delegate) {
    _scannerDelegate = delegate;
  }

  void addErrorDelegate(ErrorDelegate delegate) {
    _errorDelegate = delegate;
  }

  ZebraScanner._internal() {
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

  void close() {
    BuildConfig.instance.config.logger.i("ScannerDelegatesClosed");
    _scannerDelegate = null;
    _errorDelegate = null;
  }

  void dismiss() {
    scannerSubscription?.cancel();
  }
}
