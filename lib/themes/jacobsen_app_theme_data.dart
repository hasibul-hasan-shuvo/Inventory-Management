import 'package:dental_inventory/app/core/utils/transitions.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/text_styles.dart';
import 'package:dental_inventory/themes/app_colors.dart';
import 'package:dental_inventory/themes/app_theme_data.dart';
import 'package:dental_inventory/themes/jacobsen_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JacobsenAppThemeData implements AppThemeData {
  final AppColors _colors = JacobsenAppColors();

  @override
  ThemeData getDarkTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      primaryColor: _colors.primaryDark,
      primaryColorDark: _colors.bgCardDark,
      primaryColorLight: _colors.primary,
      buttonTheme: const ButtonThemeData(alignedDropdown: true),
      cardColor: _colors.bgCardDark,
      iconTheme: IconThemeData(color: _colors.colorWhite),
      indicatorColor: _colors.colorWhite,
      dividerColor: _colors.dividerDark,
      dividerTheme: DividerThemeData(color: _colors.dividerDark),
      hintColor: _colors.basicGreyDark,
      dialogBackgroundColor: _colors.bgPageDark,
      scaffoldBackgroundColor: _colors.bgPageDark,
      textTheme: _textThemeDark,
      appBarTheme: _appBarThemeDark,
      fontFamily: _getFont(),
      colorScheme: _colorSchemeDark,
      useMaterial3: true,
      bottomNavigationBarTheme: _bottomNavigationBarThemeDataDark,
      bottomSheetTheme: _bottomSheetThemeDataDark,
      dialogTheme: _dialogThemeDark,
      popupMenuTheme: _popupMenuThemeDark,
      shadowColor: Colors.black12,
      pageTransitionsTheme: pageTransitionsTheme,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(shape: CircleBorder()),
    );
  }

  @override
  ThemeData getLightTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      primaryColor: _colors.primary,
      primaryColorDark: _colors.primaryDark,
      primaryColorLight: _colors.primary,
      cardColor: _colors.bgCardLight,
      iconTheme: IconThemeData(color: _colors.colorBlack),
      indicatorColor: _colors.colorBlack,
      buttonTheme: const ButtonThemeData(alignedDropdown: true),
      dividerColor: _colors.divider,
      dividerTheme: DividerThemeData(color: _colors.divider),
      hintColor: _colors.basicGrey,
      dialogBackgroundColor: _colors.bgPageLight,
      scaffoldBackgroundColor: _colors.bgPageLight,
      textTheme: _textThemeLight,
      appBarTheme: _appBarThemeLight,
      fontFamily: _getFont(),
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
      bottomNavigationBarTheme: _bottomNavigationBarThemeDataLight,
      bottomSheetTheme: _bottomSheetThemeDataLight,
      dialogTheme: _dialogThemeLight,
      popupMenuTheme: _popupMenuThemeLight,
      shadowColor: Colors.black12,
      pageTransitionsTheme: pageTransitionsTheme,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(shape: CircleBorder()),
    );
  }

  BottomNavigationBarThemeData get _bottomNavigationBarThemeDataDark =>
      BottomNavigationBarThemeData(
        backgroundColor: _colors.primaryDark,
        selectedItemColor: _colors.colorWhite,
        unselectedItemColor: _colors.lightGreyColor,
        selectedLabelStyle:
            labelMediumTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        unselectedLabelStyle:
            labelMediumTextStyleDark.copyWith(color: _colors.textPrimaryDark),
      );

  BottomNavigationBarThemeData get _bottomNavigationBarThemeDataLight =>
      BottomNavigationBarThemeData(
        backgroundColor: _colors.primary,
        selectedItemColor: _colors.colorWhite,
        unselectedItemColor: _colors.lightGreyColor,
        selectedLabelStyle:
            labelMediumTextStyle.copyWith(color: _colors.textPrimaryLight),
        unselectedLabelStyle:
            labelMediumTextStyle.copyWith(color: _colors.textPrimaryLight),
      );

  AppBarTheme get _appBarThemeDark => AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _colors.primaryDark,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: _colors.colorWhite),
        backgroundColor: _colors.primaryDark,
        titleTextStyle: appBarTextStyleDark.copyWith(
          fontFamily: _getFont(),
          color: _colors.appBarTextDark,
        ),
      );

  AppBarTheme get _appBarThemeLight => AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _colors.primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: _colors.colorWhite),
        backgroundColor: _colors.primary,
        titleTextStyle: appBarTextStyle.copyWith(
          fontFamily: _getFont(),
          color: _colors.appBarTextLight,
        ),
      );

  ColorScheme get _colorSchemeDark => ColorScheme.dark(
        brightness: Brightness.dark,
        primary: _colors.colorWhite,
        secondary: _colors.secondaryColor,
        onSecondary: _colors.primaryDark,
        background: _colors.bgPageDark,
        onBackground: _colors.colorWhite,
        error: _colors.errorColorDark,
        errorContainer: _colors.errorContainerDark,
        onErrorContainer: _colors.onErrorContainerDark,
      );

  ColorScheme get _colorSchemeLight => ColorScheme.light(
        brightness: Brightness.light,
        primary: _colors.primary,
        onSecondary: _colors.primary,
        secondary: _colors.secondaryColor,
        background: _colors.bgPageLight,
        onBackground: _colors.primary,
        error: _colors.errorColor,
        errorContainer: _colors.errorContainerLight,
        onErrorContainer: _colors.onErrorContainerLight,
      );

  TextTheme get _textThemeDark => TextTheme(
        displaySmall:
            displaySmallTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        displayMedium:
            displayMediumTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        displayLarge:
            displayLargeTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        headlineSmall:
            headlineSmallTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        headlineMedium: headlineMediumTextStyleDark.copyWith(
            color: _colors.textPrimaryDark),
        headlineLarge:
            headlineLargeTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        titleSmall:
            titleSmallTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        titleMedium:
            titleMediumTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        titleLarge:
            titleLargeTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        bodySmall:
            bodySmallTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        bodyMedium:
            bodyMediumTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        bodyLarge:
            bodyLargeTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        labelSmall:
            labelSmallTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        labelMedium:
            labelMediumTextStyleDark.copyWith(color: _colors.textPrimaryDark),
        labelLarge:
            labelLargeTextStyleDark.copyWith(color: _colors.textPrimaryDark),
      );

  TextTheme get _textThemeLight => TextTheme(
        displaySmall:
            displaySmallTextStyle.copyWith(color: _colors.textPrimaryLight),
        displayMedium:
            displayMediumTextStyle.copyWith(color: _colors.textPrimaryLight),
        displayLarge:
            displayLargeTextStyle.copyWith(color: _colors.textPrimaryLight),
        headlineSmall:
            headlineSmallTextStyle.copyWith(color: _colors.textPrimaryLight),
        headlineMedium:
            headlineMediumTextStyle.copyWith(color: _colors.textPrimaryLight),
        headlineLarge:
            headlineLargeTextStyle.copyWith(color: _colors.textPrimaryLight),
        titleSmall:
            titleSmallTextStyle.copyWith(color: _colors.textPrimaryLight),
        titleMedium:
            titleMediumTextStyle.copyWith(color: _colors.textPrimaryLight),
        titleLarge:
            titleLargeTextStyle.copyWith(color: _colors.textPrimaryLight),
        bodySmall: bodySmallTextStyle.copyWith(color: _colors.textPrimaryLight),
        bodyMedium:
            bodyMediumTextStyle.copyWith(color: _colors.textPrimaryLight),
        bodyLarge: bodyLargeTextStyle.copyWith(color: _colors.textPrimaryLight),
        labelSmall:
            labelSmallTextStyle.copyWith(color: _colors.textPrimaryLight),
        labelMedium:
            labelMediumTextStyle.copyWith(color: _colors.textPrimaryLight),
        labelLarge:
            labelLargeTextStyle.copyWith(color: _colors.textPrimaryLight),
      );

  BottomSheetThemeData get _bottomSheetThemeDataLight =>
      const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppValues.radius),
            topRight: Radius.circular(AppValues.radius),
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black12,
      );

  BottomSheetThemeData get _bottomSheetThemeDataDark =>
      const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppValues.radius),
            topRight: Radius.circular(AppValues.radius),
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black12,
      );

  DialogTheme get _dialogThemeLight => DialogTheme(
        shadowColor: Colors.black12,
        backgroundColor: _colors.bgCardLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.smallRadius),
        ),
      );

  DialogTheme get _dialogThemeDark => DialogTheme(
        shadowColor: Colors.black12,
        backgroundColor: _colors.bgCardDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.smallRadius),
        ),
      );

  PopupMenuThemeData get _popupMenuThemeLight => PopupMenuThemeData(
        color: _colors.bgPageLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius),
        ),
        textStyle:
            titleMediumTextStyle.copyWith(color: _colors.textPrimaryLight),
      );

  PopupMenuThemeData get _popupMenuThemeDark => PopupMenuThemeData(
        color: _colors.bgPageDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius),
        ),
        textStyle:
            titleMediumTextStyleDark.copyWith(color: _colors.textPrimaryDark),
      );

  String _getFont() {
    return 'Roboto';
  }
}
