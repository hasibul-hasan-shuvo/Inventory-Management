import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/scanner_controller.dart';

// ignore: must_be_immutable
class ScannerView extends BaseView<ScannerController> {
  String? result;
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
          _getButtons(),
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

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _getTorchButton(),
        SizedBox(width: AppValues.smallMargin.w),
        _getCheckInButton(),
      ],
    );
  }

  Widget _getTorchButton() {
    return ValueListenableBuilder(
      valueListenable: _scannerController.torchState,
      builder: (_, state, ___) => FloatingActionButton(
        heroTag: 'torch',
        backgroundColor: state == TorchState.on
            ? theme.colorScheme.primary
            : AppColors.basicGrey,
        onPressed: _onPressedTorch,
        child: AssetImageView(
          fileName: AppIcons.torch,
          height: AppValues.iconDefaultSize.h,
          color: state == TorchState.on
              ? theme.colorScheme.onPrimary
              : AppColors.colorWhite,
        ),
      ),
    );
  }

  Widget _getCheckInButton() {
    return FloatingActionButton(
      onPressed: _onPressedDoneButton,
      child: Icon(
        Icons.done,
        size: AppValues.iconDefaultSize.h,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }

  void _onPressedTorch() {
    _scannerController.toggleTorch();
  }

  void _onPressedDoneButton() {
    _scannerController.stop();
    Get.back(result: result);
  }

  void _onDetect(BarcodeCapture capture) {
    if (capture.barcodes.isNotEmpty) {
      result = capture.barcodes.first.rawValue;
    }
  }
}
