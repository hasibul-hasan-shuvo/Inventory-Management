typedef ScannerDelegate = Function(String? code);
typedef ErrorDelegate = Function(Object error);

abstract class Scanner {
  void addScannerDelegate(ScannerDelegate delegate);

  void addErrorDelegate(ErrorDelegate delegate);

  void close();

  void dismiss();
}
