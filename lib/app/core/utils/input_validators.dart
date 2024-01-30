import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InputValidators {
  static final _userNameRegX = RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,29}$');

  static final _emailRegX = RegExp(
      r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))');

  // static final _phoneRegX = RegExp(r"^\+(?:\d\s?){6,14}\d$");

  static String? userName(String? value, AppLocalizations appLocalization) {
    if (value!.isEmpty) return appLocalization.fieldCannotBeEmpty;

    return !_userNameRegX.hasMatch(value)
        ? appLocalization.userNameValidator
        : null;
  }

  static String? email(String? value, AppLocalizations appLocalization) {
    if (value!.isEmpty) return appLocalization.fieldCannotBeEmpty;

    return !_emailRegX.hasMatch(value) ? appLocalization.invalidEmail : null;
  }

  static String? phone(String? value, AppLocalizations appLocalization) {
    if (value!.isEmpty) return appLocalization.fieldCannotBeEmpty;

    return value.length != 9 ? appLocalization.mustBe11DigitsLong : null;
  }

  static String? password(String? value, AppLocalizations appLocalization) {
    if (value!.isEmpty) return appLocalization.fieldCannotBeEmpty;

    if (value.length < 8) {
      return appLocalization.passwordValidator;
    }

    // Check for at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return appLocalization.passwordUpperCaseValidator;
    }

    // Check for at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return appLocalization.passwordLowerCaseValidator;
    }

    // Check for at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return appLocalization.passwordNumberValidator;
    }

    // Check for at least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return appLocalization.passwordSpecialCharacterValidator;
    }

    return null;
  }

  static String? confirmPassword(
      String? value, AppLocalizations appLocalization, String? password) {
    if (value!.isEmpty) return appLocalization.fieldCannotBeEmpty;

    return value != password ? appLocalization.passwordValidator : null;
  }

  static String? name(String? value, AppLocalizations appLocalization) {
    return value!.isEmpty ? appLocalization.fieldCannotBeEmpty : null;
  }

  static String? otp(String? value, AppLocalizations appLocalization) {
    if (value!.isEmpty) {
      return appLocalization.fieldCannotBeEmpty;
    }

    if (value.length != 6) {
      return appLocalization.otpValidator;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return appLocalization.otpDigitValidator;
    }

    return null;
  }
}
