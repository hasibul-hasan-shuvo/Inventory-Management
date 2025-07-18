import 'dart:io';

import 'package:dental_inventory/app/core/model/theme.dart';
import 'package:dental_inventory/app/core/services/offline_service/data_sync_manager.dart';
import 'package:dental_inventory/app/core/services/scanner/scanner_service.dart';
import 'package:dental_inventory/app/core/values/app_languages.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/app/bindings/initial_binding.dart';
import '/app/routes/app_pages.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  bool _didLanguageSet = false;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;
  final PreferenceManager _preference = PreferenceManagerImpl();
  DataSyncManager? _dataSyncManager;

  @override
  void initState() {
    super.initState();
    _dataSyncManager = DataSyncManager();
  }

  @override
  void dispose() {
    _dataSyncManager?.dispose();
    ScannerService.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _localizeApp();

    return ScreenUtilInit(
      designSize: const Size(
        AppValues.draftLayoutWidth,
        AppValues.draftLayoutHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? widget) {
        ScreenUtil.init(context);

        return GetMaterialApp(
          title: _envConfig.appName,
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: _getSupportedLocal(),
          theme: _getTheme(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  ThemeData _getTheme() {
    String savedTheme = _preference.getString(
      PreferenceManager.THEME,
      defaultValue: AppTheme.SYSTEM.name,
    );

    _envConfig.logger.i("Saved Theme: $savedTheme");

    if (savedTheme == AppTheme.DARK.name) {
      return _envConfig.themeData.getDarkTheme();
    } else if (savedTheme == AppTheme.LIGHT.name) {
      return _envConfig.themeData.getLightTheme();
    } else {
      return _getThemeSameAsSystem();
    }
  }

  ThemeData _getThemeSameAsSystem() {
    return Get.isPlatformDarkMode
        ? _envConfig.themeData.getDarkTheme()
        : _envConfig.themeData.getLightTheme();
  }

  void _localizeApp() {
    BuildConfig.instance.config.logger.i("Language: ${Platform.localeName}");
    String appLanguage = _preference.getString(
      PreferenceManager.LANGUAGE,
      defaultValue: Platform.localeName,
    );

    if (appLanguage.contains(AppLanguages.en.name)) {
      appLanguage = AppLanguages.en.name;
    } else if (appLanguage.contains(AppLanguages.nb.name)) {
      appLanguage = AppLanguages.nb.name;
    } else if (appLanguage.contains(AppLanguages.sv.name)) {
      appLanguage = AppLanguages.sv.name;
    }

    if (!widget._didLanguageSet) {
      _envConfig.logger.i("AppLanguage: $appLanguage");
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget._didLanguageSet = true;
        Get.updateLocale(Locale(appLanguage));
      });
    }
  }

  List<Locale> _getSupportedLocal() {
    return AppLanguages.values
        .map((language) => Locale(language.name))
        .toList();
  }
}
