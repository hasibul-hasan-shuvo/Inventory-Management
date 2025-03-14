import 'package:dental_inventory/app/core/services/scanner/scanner.dart';
import 'package:dental_inventory/app/core/services/scanner/urovo_scanner.dart';
import 'package:dental_inventory/app/core/services/scanner/zebra_scanner.dart';
import 'package:dental_inventory/flavors/build_config.dart';

class ScannerService {
  static bool isInitialized = false;
  static final List<Scanner> _scanners = List.empty(growable: true);

  static Future<bool> ensureInitialized() async {
    try {
      isInitialized = await _initializeScanners();

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> _initializeScanners() async {
    await _addZebraScanner();
    await _addUrovoScanner();

    return true;
  }

  static Future<void> setScannerDelegate(ScannerDelegate delegate) async {
    if (!isInitialized) {
      await ensureInitialized();
    }
    for (var element in _scanners) {
      element.addScannerDelegate(delegate);
    }
  }

  static void setErrorDelegate(ErrorDelegate delegate) {
    for (var element in _scanners) {
      element.addErrorDelegate(delegate);
    }
  }

  static void close() {
    BuildConfig.instance.config.logger.i("ScannerDelegatesClosed");
    for (var element in _scanners) {
      element.close();
    }
  }

  static void dismiss() {
    for (var element in _scanners) {
      element.dismiss();
    }
  }

  static Future<bool> _addZebraScanner() async {
    ZebraScanner scanner = ZebraScanner();

    if (await scanner.isSupported) {
      _scanners.add(scanner);

      return true;
    }

    return false;
  }

  static Future<bool> _addUrovoScanner() async {
    UrovoScanner scanner = UrovoScanner();
    if (await scanner.isSupported) {
      _scanners.add(scanner);

      return true;
    }

    return false;
  }
}
