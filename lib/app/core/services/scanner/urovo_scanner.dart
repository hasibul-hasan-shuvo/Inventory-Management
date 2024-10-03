import 'dart:async';

import 'package:dental_inventory/app/core/services/scanner/scanner.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:laser_scanner/laser_scanner.dart';
import 'package:laser_scanner/model/scan_result_model.dart';
import 'package:laser_scanner/utils/enum_utils.dart';

class UrovoScanner extends Scanner {
  final LaserScanner _scanner = LaserScanner();

  UrovoScanner() {
    _initUrovoScanner();
  }

  @override
  void dismiss() {
    super.dismiss();
    _scanner.closeScanner();
  }

  void _initUrovoScanner() async {
    _scanner.isSupport().then((bool? isSupport) {
      if (isSupport == true) {
        _scanner.openScanner(captureImageShow: true).then((value) {
          _setTrigger();
          _enableVibrate();
          _subscribeListener();
        });
      }
    });
  }

  void _setTrigger() {
    _scanner.setTrigger(triggering: Triggering.CONTINUOUS);
  }

  void _enableVibrate() {
    _scanner.enableVibrate();
  }

  void _subscribeListener() async {
    _scanner
        .onListenerScanner(
      onListenerResultScanner: _onListenerResultScanner,
    )
        .then((StreamSubscription subscription) {
      scannerSubscription = subscription;
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
