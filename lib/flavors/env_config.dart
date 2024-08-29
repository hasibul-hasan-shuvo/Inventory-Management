import 'package:dental_inventory/app/core/values/contact_info.dart';
import 'package:dental_inventory/themes/app_colors.dart';
import 'package:dental_inventory/themes/app_theme_data.dart';
import 'package:logger/logger.dart';

import '/app/core/values/app_values.dart';

class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool shouldCollectCrashLog;
  final AppColors appColors;
  final AppThemeData themeData;
  final ContactInfo contactInfo;
  final String appLogo;
  final String accountSetupAnimation;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    required this.themeData,
    required this.appColors,
    required this.contactInfo,
    required this.appLogo,
    required this.accountSetupAnimation,
    this.shouldCollectCrashLog = false,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
          methodCount: AppValues.loggerMethodCount,
          // number of method calls to be displayed
          errorMethodCount: AppValues.loggerErrorMethodCount,
          // number of method calls if stacktrace is provided
          lineLength: AppValues.loggerLineLength,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }
}
