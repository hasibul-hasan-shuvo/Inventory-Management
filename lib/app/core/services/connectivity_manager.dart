import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityManager {
  static final ConnectivityManager _instance = ConnectivityManager._internal();

  factory ConnectivityManager() => _instance;

  ConnectivityManager._internal() {
    _initConnectivity();
  }

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  bool _isOnline = false;

  bool get isOnline => _isOnline;

  final StreamController<bool> _connectivityStreamController =
      StreamController<bool>.broadcast();

  Stream<bool> get connectivityStream => _connectivityStreamController.stream;

  void _initConnectivity() {
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _isOnline = _hasInternetConnection(result);
      _connectivityStreamController.add(_isOnline);
    });
    _checkInitialConnectivity();
  }

  void _checkInitialConnectivity() async {
    _connectivity.checkConnectivity().then((result) {
      _isOnline = _hasInternetConnection(result);
      _connectivityStreamController.add(_isOnline);
    });
  }

  bool _hasInternetConnection(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    }

    return false;
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityStreamController.close();
  }
}
