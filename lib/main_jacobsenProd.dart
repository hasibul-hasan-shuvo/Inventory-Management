import 'package:dental_inventory/app/core/services/firebase_service.dart';
import 'package:dental_inventory/app/core/services/scanner/scanner_service.dart';
import 'package:dental_inventory/app/core/values/app_assets.dart';
import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:dental_inventory/app/core/values/environment_values.dart';
import 'package:dental_inventory/app/core/values/jacobsen_contact_info.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:dental_inventory/themes/jacobsen_app_colors.dart';
import 'package:dental_inventory/themes/jacobsen_app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() async {
  EnvConfig prodConfig = EnvConfig(
    appName: "Jacobsen Dental",
    baseUrl: "https://inventorybe-prod-pjgpawjrytdxu-webapp.azurewebsites.net",
    themeData: JacobsenAppThemeData(),
    appColors: JacobsenAppColors(),
    contactInfo: JacobsenContactInfo(),
    appLogo: AppImages.jacobsenLogo,
    accountSetupAnimation: AppAssets.jacobsenAccountSetupAnimation,
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.JACOBSEN_PRODUCTION,
    envConfig: prodConfig,
  );

  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  await dotenv.load(fileName: "conf/.env", mergeWith: envValues);

  await GetStorage.init(PreferenceManager.DATABASE_NAME);

  await ScannerService.ensureInitialized();

  FirebaseService.enableFirebase(Environment.JACOBSEN_PRODUCTION);

  runApp(MyApp());
}
