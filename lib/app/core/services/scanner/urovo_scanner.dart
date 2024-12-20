import 'dart:async';
import 'dart:io';

import 'package:dental_inventory/app/core/services/scanner/scanner.dart';
import 'package:laser_scanner/laser_scanner.dart';
import 'package:laser_scanner/model/scan_result_model.dart';
import 'package:laser_scanner/model/symbology_model.dart';
import 'package:laser_scanner/utils/enum_utils.dart';

class UrovoScanner extends Scanner {
  final LaserScanner _scanner = LaserScanner();

  UrovoScanner() {
    _initUrovoScanner();
  }

  @override
  void dismiss() {
    super.dismiss();
    _scanner.stopDecode();
    _scanner.closeScanner();
  }

  void _initUrovoScanner() async {
    if (Platform.isAndroid) {
      _scanner.isSupport().then((bool? isSupport) {
        if (isSupport == true) {
          _scanner.openScanner(captureImageShow: true).then(onOpenCapture);
        }
      });
    }
  }

  void onOpenCapture(void value) async {
    await _setTrigger();
    await _enableVibrate();
    await _enableSymbology();
    await _setScanOutputMode();
    _subscribeListener();
  }

  Future<void> _setTrigger() {
    return _scanner.setTrigger(triggering: Triggering.PULSE);
  }

  Future<void> _enableVibrate() {
    return _scanner.enableVibrate();
  }

  Future<void> _enableSymbology() {
    return _scanner.enableSymbology(
      symbology: SymbologyModel(
        enable: true,
        symbology: symbologyValues[Symbology.QRCODE] ?? 31,
      ),
    );
  }

  Future<void> _setScanOutputMode() {
    return _scanner.setScanOutputMode(
      scanOutputMode: ScanOutputMode.decodeOuputModeIntent,
    );
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
    publishScannedCode(barcode);
    _scanner.stopDecode();
  }
}
