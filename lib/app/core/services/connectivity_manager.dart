import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityManager {
  static final ConnectivityManager _instance = ConnectivityManager._internal();

  factory ConnectivityManager() => _instance;

  ConnectivityManager._internal() {
    _initConnectivity();
  }

  final InternetConnectionChecker _connectionChecker =
      InternetConnectionChecker();
  StreamSubscription<InternetConnectionStatus>? _connectivitySubscription;
  bool _isOnline = false;

  bool get isOnline => _isOnline;

  final StreamController<bool> _connectivityStreamController =
      StreamController<bool>.broadcast();

  Stream<bool> get connectivityStream => _connectivityStreamController.stream;

  void _initConnectivity() {
    _connectivitySubscription = _connectionChecker.onStatusChange
        .listen((InternetConnectionStatus status) {
      _updateOnlineStatus(_hasConnection(status));
    });
    _checkInitialConnectivity();
  }

  void _checkInitialConnectivity() {
    _connectionChecker.hasConnection.then((isConnected) {
      _updateOnlineStatus(isConnected);
    });
  }

  bool _hasConnection(InternetConnectionStatus status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        return true;
      case InternetConnectionStatus.disconnected:
        return false;
    }
  }

  void _updateOnlineStatus(bool status) {
    _isOnline = status;
    _connectivityStreamController.add(_isOnline);
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityStreamController.close();
  }
}
