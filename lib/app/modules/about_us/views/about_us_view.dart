import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/modules/about_us/controllers/about_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/app/core/base/base_view.dart';

//ignore: must_be_immutable
class AboutUsView extends BaseView<AboutUsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding.sp),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            const SizedBox(height: 16),
            _buildDescription1(context),
            const SizedBox(height: 10),
            _buildGuideImage(),
            const SizedBox(height: 16),
            _buildDescription2(context),
          ],
        ),
      ),
    );
  }

  _buildTitle(BuildContext context) => Text(
        'Dental lagerstyring gir deg fullstendig kontroll på ditt lager.',
        style: Theme.of(context).textTheme.titleLarge,
      );

  _buildDescription1(BuildContext context) => Text(
        'Bruk kameraet på telefonen eller nettbrettet for å skanne QR-koden til produktet hver gang du tar ut en enhet fra lageret, eller når du åpner en pakning.',
      );

  _buildDescription2(BuildContext context) => Text(
        'Systemet foreslår automatisk bestilling av riktig mengde nye produkter for å holde lageret innenfor maksimums- og minimumsverdiene. Appen sparer deg for tid og penger og sikrer at tannlegekontoret alltid har det den trenger.',
      );

  _buildGuideImage() => const Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [AssetImageView(fileName: AppIcons.icDentalGuide)],
        ),
      );
}
