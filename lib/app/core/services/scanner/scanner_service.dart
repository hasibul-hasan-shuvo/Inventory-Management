import 'package:dental_inventory/app/core/services/scanner/scanner.dart';
import 'package:dental_inventory/app/core/services/scanner/zebra_scanner.dart';
import 'package:dental_inventory/flavors/build_config.dart';

class ScannerService {
  static final ScannerService _instance = ScannerService._internal();
  final List<Scanner> _scanners = List.empty(growable: true);

  factory ScannerService() {
    return _instance;
  }

  ScannerService._internal() {
    _scanners.add(ZebraScanner());
  }

  void addScannerDelegate(ScannerDelegate delegate) {
    for (var element in _scanners) {
      element.addScannerDelegate(delegate);
    }
  }

  void addErrorDelegate(ErrorDelegate delegate) {
    for (var element in _scanners) {
      element.addErrorDelegate(delegate);
    }
  }

  void close() {
    BuildConfig.instance.config.logger.i("ScannerDelegatesClosed");
    for (var element in _scanners) {
      element.close();
    }
  }

  void dismiss() {
    for (var element in _scanners) {
      element.dismiss();
    }
  }
}
