import 'package:flutter/material.dart';

abstract class AppColors {
  final Color pageBackground;
  final Color colorWhite;
  final Color colorBlack;
  final Color lightGreyColor;
  final Color errorColor;
  final Color errorColorDark;
  final Color colorRed;
  final Color colorGreen;
  final Color defaultRippleColor;
  final Color primary;
  final Color primaryDark;
  final Color bgPageLight;
  final Color bgPageDark;
  final Color bgCardLight;
  final Color bgCardDark;
  final Color appBarTextLight;
  final Color appBarTextDark;
  final Color textPrimaryLight;
  final Color textPrimaryDark;
  final Color textPrimaryButton;
  final Color divider;
  final Color dividerDark;
  final Color basicGrey;
  final Color basicGreyDark;
  final Color errorContainerLight;
  final Color errorContainerDark;
  final Color loaderBackground;
  final Color secondaryColor;
  final Color loginScreenIconColor;
  final Color bgDismissibleItem;
  final Color bgSnackBarErrorDark;
  final Color bgSnackBarSuccessDark;
  final Color bgSnackBarWarningDark;
  final Color bgSnackBarErrorLight;
  final Color bgSnackBarSuccessLight;
  final Color bgSnackBarWarningLight;

  const AppColors({
    required this.primary,
    required this.primaryDark,
    required this.secondaryColor,
    this.pageBackground = const Color(0xFFFAFBFD),
    this.colorWhite = const Color(0xFFFFFFFF),
    this.colorBlack = const Color(0xFF000000),
    this.lightGreyColor = const Color(0xFFC4C4C4),
    this.errorColor = const Color(0xFFE36161),
    this.errorColorDark = const Color(0xFFE36161),
    this.colorRed = const Color(0xFFEB001B),
    this.colorGreen = const Color(0xFF6AB452),
    this.defaultRippleColor = const Color(0x0338686A),
    this.bgPageLight = const Color(0xFFF9F8F4),
    this.bgPageDark = const Color(0xFF191c1d),
    this.bgCardLight = Colors.white,
    this.bgCardDark = const Color(0xFF354a53),
    this.appBarTextLight = Colors.white,
    this.appBarTextDark = Colors.white,
    this.textPrimaryLight = Colors.black,
    this.textPrimaryDark = Colors.white,
    this.textPrimaryButton = Colors.white,
    this.divider = const Color(0xffb1b9bb),
    this.dividerDark = const Color(0xFF8a9296),
    this.basicGrey = const Color(0xFF66708C),
    this.basicGreyDark = const Color(0xFFFFFFFF),
    this.errorContainerLight = const Color(0xFFffdad6),
    this.errorContainerDark = const Color(0xFF93000a),
    this.loaderBackground = const Color(0x32000000),
    this.loginScreenIconColor = const Color(0xffD9D9D9),
    this.bgDismissibleItem = const Color(0xFF80DB7E),
    this.bgSnackBarErrorDark = const Color(0xFF1E1E1E),
    this.bgSnackBarSuccessDark = const Color(0xFF0E1F00),
    this.bgSnackBarWarningDark = const Color(0xFF150900),
    this.bgSnackBarErrorLight = const Color(0xFFF9E1DC),
    this.bgSnackBarSuccessLight = const Color(0xFFE4F6DF),
    this.bgSnackBarWarningLight = const Color(0xFFFCF3EA),
  });
}
