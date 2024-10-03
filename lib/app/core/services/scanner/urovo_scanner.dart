import 'dart:async';

import 'package:dental_inventory/app/core/services/scanner/scanner.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:laser_scanner/laser_scanner.dart';
import 'package:laser_scanner/model/scan_result_model.dart';
import 'package:laser_scanner/utils/enum_utils.dart';
import 'package:logger/logger.dart';

class UrovoScanner extends Scanner {
  final LaserScanner _scanner = LaserScanner();

  UrovoScanner() {
    _initUrovoScanner();
  }

  @override
  void dismiss() {
    super.dismiss();
    Logger().d("Stopped decoding");
    _scanner.stopDecode();
    _scanner.closeScanner();
  }

  void _initUrovoScanner() async {
    Logger().d("Initializing Urovo scanner...");
    _scanner.isSupport().then((bool? isSupport) {
      Logger().d("Is device supported: $isSupport");
      if (isSupport == true) {
        Logger().d("Opening scanner...");
        _scanner.openScanner(captureImageShow: true).then((_) {
          Logger().d("Scanner opened");
          _setTrigger();
          _enableVibrate();
          _subscribeListener();
        });
      }
    });
  }

  void _setTrigger() {
    Logger().d("Setting trigger mode");
    _scanner.setTrigger(triggering: Triggering.CONTINUOUS);
  }

  void _enableVibrate() {
    Logger().d("Enabling vibrate");
    _scanner.enableVibrate();
  }

  void _subscribeListener() {
    Logger().d("Subscribing listeners...");
    _scanner
        .onListenerScanner(
      onListenerResultScanner: _onListenerResultScanner,
    )
        .then((StreamSubscription subscription) {
      Logger().d("Subscribed listener");
      scannerSubscription = subscription;
      _scanner.startDecode().then((value) => Logger().d("Started decoding"););
    });
  }

  void _onListenerResultScanner(ScanResultModel? result) {
    if (result == null) {
      publishError('Code not found');

      return;
    }
    String? barcode = result.barcode;
    BuildConfig.instance.config.logger.d("UrovoBarcodeString: $barcode");
    publishScannedCode(barcode);
  }
}
