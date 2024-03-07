import 'package:dental_inventory/app/core/services/firebase_service.dart';
import 'package:dental_inventory/app/core/values/environment_values.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() async {
  EnvConfig prodConfig = EnvConfig(
    appName: "Dental Inventory",
    baseUrl: "https://api.github.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  await dotenv.load(fileName: "conf/.env", mergeWith: envValues);

  await GetStorage.init(PreferenceManager.DATABASE_NAME);

  FirebaseService.enableFirebase(Environment.PRODUCTION);

  runApp(MyApp());
}
