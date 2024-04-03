import 'package:dental_inventory/app/core/utils/url_launcher.dart';
import 'package:dental_inventory/app/core/values/app_strings.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/contact_us_controller.dart';
import '/app/core/base/base_view.dart';

// ignore: must_be_immutable
class ContactUsView extends BaseView<ContactUsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.bottomNavContactUs);

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPostAddress(context),
            SizedBox(height: AppValues.halfPadding.h),
            _buildBookAddress(context),
            SizedBox(height: AppValues.halfPadding.h),
            _buildTelephone(context),
            _buildEmail(context),
            SizedBox(height: AppValues.halfPadding.h),
            _buildTime(context),
            SizedBox(height: AppValues.halfPadding.h),
            _buildDescription(),
            SizedBox(height: AppValues.halfPadding.h),
            _buildContactList(),
          ],
        ),
      ),
    );
  }

  ListView _buildContactList() {
    final contacts = controller.getContacts();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return _buildContactRow(
          contacts[index].name,
          contacts[index].number,
        );
      },
    );
  }

  Text _buildDescription() {
    return Text(
      appLocalization.contactDescription,
      style: textTheme.bodySmall,
    );
  }

  Widget _buildTime(BuildContext context) {
    return _buildVerticalInfo(
      context,
      appLocalization.openingHourTitle,
      appLocalization.openingHourMessage,
    );
  }

  Widget _buildEmail(BuildContext context) {
    return Ripple(
      onTap: _onTapEmail,
      child: Row(
        children: [
          Text(
            appLocalization.email,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(width: AppValues.margin_4.w),
          const Text(
            AppStrings.email,
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTelephone(BuildContext context) {
    return Ripple(
      onTap: () => _onTapPhoneNumber(AppStrings.phoneNumber),
      child: Row(
        children: [
          Text(
            appLocalization.phone,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(width: AppValues.margin_4.w),
          const Text(AppStrings.phoneNumber),
        ],
      ),
    );
  }

  Widget _buildBookAddress(BuildContext context) {
    return _buildVerticalInfo(
      context,
      appLocalization.visitingAddress,
      AppStrings.visitingAddress,
    );
  }

  Widget _buildPostAddress(BuildContext context) {
    return _buildVerticalInfo(
      context,
      appLocalization.postalAddress,
      AppStrings.postalAddress,
    );
  }

  Column _buildVerticalInfo(BuildContext context, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          value,
        ),
      ],
    );
  }

  Widget _buildContactRow(String title, String value) => Ripple(
        onTap: () => _onTapPhoneNumber(value),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
              ),
            ),
          ],
        ),
      );

  void _onTapPhoneNumber(String phoneNumber) {
    String url = 'tel:$phoneNumber';
    UrlLauncher.launchUrl(url);
  }

  void _onTapEmail() {
    String url = 'mailto:${AppStrings.email}';
    UrlLauncher.launchUrl(url);
  }
}
