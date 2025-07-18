import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/utils/url_launcher.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/values/text_styles.dart';
import 'package:dental_inventory/app/core/widget/app_primary_button.dart';
import 'package:dental_inventory/app/core/widget/app_text_field.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/login/models/auth_page_state.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_values.dart';
import '../../main/views/main_app_bar.dart';
import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends BaseView<LoginController> {
  LoginView() {
    _subscribeToLoginState();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      MainAppBar(isLogOutVisible: false);
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget? bottomNavigationBar() {
    return Container(
      color: appColors.primary,
      height: AppBar().preferredSize.height.h,
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPhoneContact(),
            _buildEmailContact(),
          ],
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Form(
            key: _formKey,
            child: AutofillGroup(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildEmailTextField(),
                  SizedBox(height: AppValues.height_16.h),
                  _buildPasswordTextField(),
                  SizedBox(height: AppValues.margin_20.h),
                  _buildSignInButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return AppTextField(
      prefix: const Icon(Icons.person_rounded),
      keyboardType: TextInputType.emailAddress,
      controller: _loginController,
      labelText: appLocalization.email,
      hintText: appLocalization.enterEmail,
      onChanged: (value) {
        controller.email = value ?? "";
      },
      maxLength: AppValues.maxEmailLength,
      inputAction: TextInputAction.next,
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.username,
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return AppTextField(
      prefix: const Icon(Icons.key_outlined),
      controller: _passwordController,
      onChanged: (value) {
        controller.password = value ?? "";
      },
      obscureText: true,
      labelText: appLocalization.password,
      hintText: appLocalization.enterPassword,
      maxLength: AppValues.maxPasswordLength,
      inputAction: TextInputAction.go,
      onSubmit: (_) => _onLoginButtonTap(),
      autofillHints: const [AutofillHints.password],
    );
  }

  Widget _buildSignInButton() {
    return AppPrimaryButton(
      title: appLocalization.logIn,
      onPressed: _onLoginButtonTap,
    );
  }

  Widget _buildEmailContact() {
    return Expanded(
      child: Ripple(
        onTap: _onTapEmail,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.email_outlined,
              color: appColors.loginScreenIconColor,
            ),
            SizedBox(width: AppValues.smallMargin.w),
            Text(
              BuildConfig.instance.config.contactInfo.email,
              style: labelSmallTextStyle.copyWith(color: appColors.colorWhite),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneContact() {
    return Expanded(
      child: Ripple(
        onTap: _onTapPhoneNumber,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.call, color: appColors.loginScreenIconColor),
            SizedBox(width: AppValues.smallMargin.w),
            Text(
              BuildConfig.instance.config.contactInfo.phone,
              style: labelSmallTextStyle.copyWith(color: appColors.colorWhite),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginButtonTap() {
    closeKeyboard();
    if (_formKey.currentState!.validate()) {
      TextInput.finishAutofillContext();
      controller.login();
    }
  }

  void _subscribeToLoginState() {
    controller.authPageState.listen((state) {
      if (state.status == PageStatus.success) {
        Get.offAllNamed(Routes.ACCOUNT_SETUP);
        controller.resetAuthPageState();
      } else if (state.status == PageStatus.error) {
        if (state.message.isNotNullOrEmpty) {
          controller.showErrorMessage(state.message ?? 'Something wrong');
        } else {
          controller.showErrorMessage('Something wrong');
        }
        controller.resetAuthPageState();
      }
    });
  }

  void _onTapPhoneNumber() {
    String url = 'tel:${BuildConfig.instance.config.contactInfo.phone}';
    UrlLauncher.launchUrl(url);
  }

  void _onTapEmail() {
    String url = 'mailto:${BuildConfig.instance.config.contactInfo.email}';
    UrlLauncher.launchUrl(url);
  }
}
