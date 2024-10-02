import 'dart:convert';
import 'dart:io';

import 'package:dental_inventory/app/core/services/scanner/scanner.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:flutter/services.dart';

class ZebraScanner extends Scanner {
  static const EventChannel scanChannel =
      EventChannel('inventorymanagement.no/scan');

  ZebraScanner() {
    _initZebraScanner();
  }

  void _onEvent(event) {
    Map data = jsonDecode(event);
    String? barcode = data['data'];
    BuildConfig.instance.config.logger.d("BarcodeString: $barcode");
    publishScannedCode(barcode);
  }

  void _onError(Object error) {
    BuildConfig.instance.config.logger.d("BarcodeError: $error");
    publishError(error.toString());
  }

  void _initZebraScanner() {
    if (Platform.isAndroid) {
      scannerSubscription = scanChannel.receiveBroadcastStream().listen(
            _onEvent,
            onError: _onError,
          );
    }
  }
}
