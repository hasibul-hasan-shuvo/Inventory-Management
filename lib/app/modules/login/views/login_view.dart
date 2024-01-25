import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_strings.dart';
import 'package:dental_inventory/app/core/values/text_styles.dart';
import 'package:dental_inventory/app/core/widget/app_primary_button.dart';
import 'package:dental_inventory/app/core/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/validators/input_validators.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../main/views/main_app_bar.dart';
import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends BaseView<LoginController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => MainAppBar(
        isLogOutVisible: false,
      );
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget? bottomNavigationBar() {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      height: AppBar().preferredSize.height,
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPhoneContact(),
            _buildEmailContact(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailContact() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.email_outlined, color: AppColors.loginScreenIconColor),
        SizedBox(
          width: AppValues.smallMargin.w,
        ),
         Text(
          AppStrings.email,
          style:  labelSmallTextStyle.copyWith(
            color: AppColors.colorWhite
          )
        ),
      ],
    );
  }

  Widget _buildPhoneContact() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.call, color: AppColors.loginScreenIconColor),
        SizedBox(
          width: AppValues.smallMargin.w,
        ),
         Text(
          AppStrings.phoneNumber,
          style: labelSmallTextStyle.copyWith(
            color:AppColors.colorWhite
          )
        ),
      ],
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
                _buildPasswordTextField(),
                SizedBox(
                  height: AppValues.height_16.h,
                ),
                _buildSignInButton()
                // _buildSignInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(left: AppValues.margin_2),
        child: Text(appLocalization.password),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(
          top: AppValues.smallMargin.h,
        ),
        child: AppTextField(
          prefix: const Icon(Icons.key_outlined),
          controller: _passwordController,
          validator: InputValidators.password,
          onChanged: (value) {},
          obscureText: true,
          labelText: appLocalization.enterPassword,
          hintText: appLocalization.enterPassword,
        ),
      ),
    );
  }

  //
  Widget _buildEmailTextField() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(
          left: AppValues.margin_2,
        ),
        child: Text(appLocalization.email),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: AppValues.smallMargin),
        child: AppTextField(
          prefix: const Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
          controller: _loginController,
          labelText: appLocalization.enterEmail,
          hintText: appLocalization.enterEmail,
          validator: InputValidators.email,
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return AppPrimaryButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
        title: appLocalization.logIn);
  }
}
