import 'package:dental_inventory/app/core/services/firebase_service.dart';
import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:dental_inventory/app/core/values/environment_values.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:dental_inventory/themes/dab_app_colors.dart';
import 'package:dental_inventory/themes/dab_app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "DAB Shop",
    baseUrl: "https://dab-inventorybe-dev-webapp.azurewebsites.net",
    themeData: DabAppThemeData(),
    appColors: DabAppColors(),
    appLogo: AppImages.dabLogo,
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DAB_PRODUCTION,
    envConfig: devConfig,
  );

  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  await dotenv.load(fileName: "conf/.env", mergeWith: envValues);

  await GetStorage.init(PreferenceManager.DATABASE_NAME);

  FirebaseService.enableFirebase(Environment.DAB_PRODUCTION);

  runApp(MyApp());
}
