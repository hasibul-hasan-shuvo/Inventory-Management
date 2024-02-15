import 'package:flutter/material.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:get_storage/get_storage.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() async {
  EnvConfig prodConfig = EnvConfig(
    appName: "Dental Inventory",
    baseUrl: "https://inventorybe-p372dbld2tofy-webapp.azurewebsites.net",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  await GetStorage.init(PreferenceManager.DATABASE_NAME);

  runApp(MyApp());
}
