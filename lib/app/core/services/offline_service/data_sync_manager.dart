import 'dart:async';

import 'package:dental_inventory/app/core/services/connectivity_manager.dart';
import 'package:dental_inventory/app/core/services/offline_service/data_synchronizer.dart';
import 'package:dental_inventory/app/core/services/offline_service/models/data_synchronizer_key.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:get/get.dart';

class DataSyncManager {
  static final DataSyncManager _instance = DataSyncManager._internal();

  factory DataSyncManager() => _instance;

  DataSyncManager._internal() {
    _init();
  }

  final ConnectivityManager _connectivityManager = ConnectivityManager();
  StreamSubscription<bool>? _connectivitySubscription;
  bool _isSyncing = false;
  Timer? _deBouncer;
  RxBool isDataSynced = RxBool(false);
  int _loadCounter = 0;

  void _init() {
    _connectivitySubscription =
        _connectivityManager.connectivityStream.listen((isOnline) {
      syncAllDataWithServer();
    });
  }

  void syncAllDataWithServer() {
    _syncData(DataSynchronizerKey.values);
  }

  void syncDataWithServer(List<DataSynchronizerKey> keys) {
    _syncData(keys);
  }

  void _syncData(List<DataSynchronizerKey> keys) {
    if (!_isSyncing && _connectivityManager.isOnline) {
      _startDeBouncer();
      startLoader();
      for (DataSynchronizerKey key in DataSynchronizerKey.values) {
        DataSynchronizer synchronizer = DataSynchronizer.create(key);
        synchronizer.syncData().then(
              (value) => updateLoader(DataSynchronizerKey.values.length),
              onError: (_) => updateLoader(DataSynchronizerKey.values.length),
            );
      }
    }
  }

  void startLoader() {
    _loadCounter = 0;
    isDataSynced.trigger(false);
  }

  void updateLoader(int totalCount) {
    _loadCounter++;
    if (_loadCounter >= totalCount) {
      isDataSynced.trigger(true);
      _loadCounter = 0;
      _isSyncing = false;
      if (_deBouncer?.isActive == true) {
        _deBouncer?.cancel();
      }
    }
  }

  void _startDeBouncer() {
    _isSyncing = true;
    if (_deBouncer?.isActive == true) {
      _deBouncer?.cancel();
    }
    _deBouncer = Timer(
      const Duration(seconds: AppValues.dataSyncDeBouncerTime),
      () {
        _isSyncing = false;
      },
    );
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityManager.dispose();
    _deBouncer?.cancel();
    isDataSynced.close();
  }
}
