import 'dart:async';

import 'package:dental_inventory/app/core/services/connectivity_manager.dart';
import 'package:dental_inventory/app/core/services/offline_service/data_synchronizer.dart';
import 'package:dental_inventory/app/core/services/offline_service/models/data_synchronizer_key.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';

class DataSyncManager {
  static final DataSyncManager _instance = DataSyncManager._internal();

  factory DataSyncManager() => _instance;

  DataSyncManager._internal() {
    _init();
  }

  final ConnectivityManager _connectivityManager = ConnectivityManager();
  StreamSubscription<bool>? _connectivitySubscription;
  bool isSyncing = false;
  Timer? _deBouncer;

  void _init() {
    _connectivitySubscription =
        _connectivityManager.connectivityStream.listen((isOnline) {
      if (isOnline) {
        syncAllDataWithServer();
      }
    });
  }

  void syncAllDataWithServer() {
    if (!isSyncing) {
      _startDeBouncer();
      for (DataSynchronizerKey key in DataSynchronizerKey.values) {
        DataSynchronizer synchronizer = DataSynchronizer.create(key);
        synchronizer.syncData();
      }
    }
  }

  void syncDataWithServer(List<DataSynchronizerKey> keys) {
    if (_connectivityManager.isOnline && !isSyncing) {
      _startDeBouncer();
      for (DataSynchronizerKey key in keys) {
        DataSynchronizer synchronizer = DataSynchronizer.create(key);
        synchronizer.syncData();
      }
    }
  }

  void _startDeBouncer() {
    isSyncing = true;
    if (_deBouncer?.isActive == true) {
      _deBouncer?.cancel();
    }
    _deBouncer = Timer(
      const Duration(seconds: AppValues.dataSyncDeBouncerTime),
      () {
        isSyncing = false;
      },
    );
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityManager.dispose();
    _deBouncer?.cancel();
  }
}
