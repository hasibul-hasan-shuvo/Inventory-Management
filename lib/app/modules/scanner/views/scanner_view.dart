import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/scanner_controller.dart';

// ignore: must_be_immutable
class ScannerView extends BaseView<ScannerController> {
  final Rx<String?> _barCodeController = Rx(null);
  final MobileScannerController _scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.titleScannerView);

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
          overlay: const Icon(
            Icons.add,
            color: AppColors.colorWhite,
          ),
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
    return Obx(
      () => FloatingActionButton(
        onPressed: _isBarCodeDetected ? _onPressedDoneButton : null,
        backgroundColor: _isBarCodeDetected
            ? theme.colorScheme.primary
            : AppColors.basicGrey,
        child: Icon(
          Icons.done,
          size: AppValues.iconDefaultSize.h,
          color: _isBarCodeDetected
              ? theme.colorScheme.onPrimary
              : AppColors.colorWhite,
        ),
      ),
    );
  }

  void _onPressedTorch() {
    _scannerController.toggleTorch();
  }

  void _onPressedDoneButton() {
    if (_isBarCodeDetected) {
      Get.back(result: _barCodeController.value);
    } else {
      controller.showErrorMessage(appLocalization.messageCodeNotFound);
    }
  }

  void _onDetect(BarcodeCapture capture) {
    if (capture.barcodes.isNotEmpty) {
      _barCodeController(capture.barcodes.first.rawValue);
    } else {
      _barCodeController(null);
    }
  }

  bool get _isBarCodeDetected => _barCodeController.value.isNotNullOrEmpty;
}
