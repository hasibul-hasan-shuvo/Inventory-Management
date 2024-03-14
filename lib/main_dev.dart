import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "Dental Inventory Dev",
    baseUrl: "https://inventorybe-p372dbld2tofy-webapp.azurewebsites.net",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  await GetStorage.init(PreferenceManager.DATABASE_NAME);
  runApp(MyApp());
}
