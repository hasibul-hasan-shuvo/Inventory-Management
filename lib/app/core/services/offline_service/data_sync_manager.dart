import 'dart:async';

import 'package:dental_inventory/app/core/services/connectivity_manager.dart';
import 'package:dental_inventory/app/core/services/offline_service/data_synchronizer.dart';
import 'package:dental_inventory/app/core/services/offline_service/models/data_synchronizer_key.dart';

class DataSyncManager {
  static final DataSyncManager _instance = DataSyncManager._internal();

  factory DataSyncManager() => _instance;

  DataSyncManager._internal() {
    _init();
  }

  final ConnectivityManager _connectivityManager = ConnectivityManager();
  StreamSubscription<bool>? _connectivitySubscription;

  void _init() {
    _connectivitySubscription =
        _connectivityManager.connectivityStream.listen((isOnline) {
      if (isOnline) {
        _syncAllDataWithServer();
      }
    });
  }

  void _syncAllDataWithServer() {
    for (DataSynchronizerKey key in DataSynchronizerKey.values) {
      DataSynchronizer synchronizer = DataSynchronizer.create(key);
      synchronizer.syncData();
    }
  }

  void syncDataWithServer(List<DataSynchronizerKey> keys) {
    if (_connectivityManager.isOnline) {
      for (DataSynchronizerKey key in keys) {
        DataSynchronizer synchronizer = DataSynchronizer.create(key);
        synchronizer.syncData();
      }
    }
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityManager.dispose();
  }
}
