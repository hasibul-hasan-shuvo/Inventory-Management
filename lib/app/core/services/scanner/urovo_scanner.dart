import 'package:dental_inventory/app/core/services/scanner/scanner.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:laser_scanner/laser_scanner.dart';
import 'package:laser_scanner/model/scan_result_model.dart';

class UrovoScanner extends Scanner {
  UrovoScanner() {
    _initUrovoScanner();
  }

  void _initUrovoScanner() async {
    scannerSubscription = await LaserScanner().onListenerScanner(
      onListenerResultScanner: _onListenerResultScanner,
    );
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
