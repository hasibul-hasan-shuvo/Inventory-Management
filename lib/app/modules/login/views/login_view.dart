import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/utils/url_launcher.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_strings.dart';
import 'package:dental_inventory/app/core/values/text_styles.dart';
import 'package:dental_inventory/app/core/widget/app_primary_button.dart';
import 'package:dental_inventory/app/core/widget/app_textfield.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/login/models/auth_page_state.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
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
      color: AppColors.primary,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildEmailTextField(),
                SizedBox(
                  height: AppValues.height_16.h,
                ),
                _buildPasswordTextField(),
                SizedBox(
                  height: AppValues.margin_20.h,
                ),
                _buildSignInButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return AppTextField(
      prefix: const Icon(Icons.email_outlined),
      keyboardType: TextInputType.emailAddress,
      controller: _loginController,
      labelText: appLocalization.email,
      hintText: appLocalization.enterEmail,
      onChanged: (value) {
        controller.email = value ?? "";
      },
      maxLength: AppValues.maxEmailLength,
      inputAction: TextInputAction.next,
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
            const Icon(
              Icons.email_outlined,
              color: AppColors.loginScreenIconColor,
            ),
            SizedBox(width: AppValues.smallMargin.w),
            Text(
              AppStrings.email,
              style: labelSmallTextStyle.copyWith(color: AppColors.colorWhite),
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
            const Icon(Icons.call, color: AppColors.loginScreenIconColor),
            SizedBox(width: AppValues.smallMargin.w),
            Text(
              AppStrings.phoneNumber,
              style: labelSmallTextStyle.copyWith(color: AppColors.colorWhite),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginButtonTap() {
    closeKeyboard();
    if (_formKey.currentState!.validate()) {
      controller.login();
    }
  }

  void _subscribeToLoginState() {
    controller.authPageState.listen((state) {
      if (state.status == PageStatus.success) {
        Get.offAllNamed(Routes.MAIN);
        controller.resetAuthPageState();
      } else if (state.status == PageStatus.error) {
        controller.showErrorMessage(state.message ?? '');
        controller.resetAuthPageState();
      }
    });
  }

  void _onTapPhoneNumber() {
    String url = 'tel:${AppStrings.phoneNumber}';
    UrlLauncher.launchUrl(url);
  }

  void _onTapEmail() {
    String url = 'mailto:${AppStrings.email}';
    UrlLauncher.launchUrl(url);
  }
}
