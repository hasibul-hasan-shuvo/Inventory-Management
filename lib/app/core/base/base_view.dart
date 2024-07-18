import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/model/connection_status.dart';
import 'package:dental_inventory/app/core/model/page_state.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/connection_status_view.dart';
import 'package:dental_inventory/app/core/widget/loading.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:dental_inventory/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

// ignore: must_be_immutable
abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final Logger logger = BuildConfig.instance.config.logger;

  late TextTheme _textTheme;

  TextTheme get textTheme => _textTheme;

  late ThemeData _theme;

  ThemeData get theme => _theme;

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    _theme = context.theme;
    _textTheme = _theme.textTheme;

    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading()
              : Container()),
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading()
              : Container()),
          Obx(() => controller.successMessage.isNotEmpty
              ? showSuccessSnackBar(context, controller.successMessage)
              : Container()),
          Obx(() => controller.errorMessage.isNotEmpty
              ? showErrorSnackBar(context, controller.errorMessage)
              : Container()),
          Obx(() => controller.message.isNotEmpty
              ? showSnackBar(context, controller.message)
              : Container()),
          Container(),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle ??
          theme.appBarTheme.systemOverlayStyle ??
          SystemUiOverlayStyle(
            //Status bar color for android
            statusBarColor: statusBarColor(),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
      bottomSheet: _bottomSheet(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      top: useTopSafeArea,
      bottom: useBottomSafeArea,
      child: GestureDetector(
        onTap: _onTapGestureDetector,
        child: Stack(
          children: [
            body(context),
            Positioned(
              top: AppValues.margin_zero,
              left: AppValues.margin_zero,
              right: AppValues.margin_zero,
              child: Obx(
                () => _getConnectionStatusView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapGestureDetector() {
    if (activeGestureDetector) {
      closeKeyboard();
    }
  }

  Widget showSuccessSnackBar(BuildContext context, String message) {
    final snackBar = _getSnackBar(
      message,
      Icons.done,
      AppColors.colorGreen,
      controller.isDarkMode
          ? AppColors.bgSnackBarSuccessDark
          : AppColors.bgSnackBarSuccessLight,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      controller.showSuccessMessage('');
    });

    return Container();
  }

  Widget showErrorSnackBar(BuildContext context, String message) {
    final snackBar = _getSnackBar(
      message,
      Icons.warning_amber_outlined,
      AppColors.colorRed,
      controller.isDarkMode
          ? AppColors.bgSnackBarErrorDark
          : AppColors.bgSnackBarErrorLight,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      controller.showErrorMessage('');
    });

    return Container();
  }

  Widget showSnackBar(BuildContext context, String message) {
    final snackBar = _getSnackBar(
      message,
      Icons.warning_amber,
      Colors.orangeAccent,
      controller.isDarkMode
          ? AppColors.bgSnackBarWarningDark
          : AppColors.bgSnackBarWarningLight,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      controller.showSuccessMessage('');
    });

    return Container();
  }

  SnackBar _getSnackBar(
    String message,
    IconData icon,
    Color color,
    Color backgroundColor,
  ) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(width: AppValues.margin.w),
          Expanded(
            child: Text(
              message,
              style: textTheme.bodyLarge?.copyWith(color: color),
              maxLines: 2,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 1),
        borderRadius: BorderRadius.circular(AppValues.smallRadius.r),
      ),
    );
  }

  Widget _getConnectionStatusView() {
    switch (controller.connectionStatus) {
      case ConnectionStatus.NONE:
        return const SizedBox.shrink();
      case ConnectionStatus.OFFLINE:
        return _getOfflineStatusView();
      case ConnectionStatus.ONLINE:
        return _getOnlineStatusView();
    }
  }

  Widget _getOfflineStatusView() {
    return ConnectionStatusView(
      message: appLocalization.messageConnectionOffline,
      color: Colors.red,
      icon: Icons.cloud_off,
    );
  }

  Widget _getOnlineStatusView() {
    return ConnectionStatusView(
      message: appLocalization.messageConnectionOnline,
      color: Colors.green,
      icon: Icons.verified_user_outlined,
    );
  }

  Color pageBackgroundColor() {
    return theme.colorScheme.background;
  }

  Color statusBarColor() {
    return theme.colorScheme.background;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return Loading();
  }

  Widget? _bottomSheet() {
    return Wrap(
      children: [
        bottomSheet() ?? const SizedBox.shrink(),
      ],
    );
  }

  Widget? bottomSheet() {
    return null;
  }

  SystemUiOverlayStyle? get systemUiOverlayStyle {
    return null;
  }

  bool get useTopSafeArea => true;

  bool get useBottomSafeArea => true;

  bool get activeGestureDetector => true;

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
