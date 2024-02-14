import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/scanner_controller.dart';

// ignore: must_be_immutable
class ScannerView extends BaseView<ScannerController> {
  final MobileScannerController _scannerController = MobileScannerController();

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppValues.margin.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getScannerView(),
          SizedBox(height: AppValues.largeMargin.h),
          _getTorchButton(),
        ],
      ),
    );
  }

  Widget _getScannerView() {
    return SizedBox(
      height: AppValues.scannerHeight.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.smallRadius.r),
        child: MobileScanner(
          controller: _scannerController,
          onDetect: _onDetect,
        ),
      ),
    );
  }

  Widget _getTorchButton() {
    return FloatingActionButton(
      onPressed: _onPressedTorch,
      child: AssetImageView(
        fileName: AppIcons.torch,
        height: AppValues.iconDefaultSize.h,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }

  void _onPressedTorch() {
    _scannerController.toggleTorch();
  }

  void _onDetect(BarcodeCapture capture) {
    if (capture.barcodes.isNotEmpty) {
      _scannerController.stop();
      String? result = capture.barcodes.first.rawValue;
      if (result.isNotNullOrEmpty) {
        Get.back(result: result);
      }
    }
  }
}
