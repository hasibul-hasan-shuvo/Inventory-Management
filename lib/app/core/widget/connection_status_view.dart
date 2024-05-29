import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ConnectionStatusView extends StatelessWidget with BaseWidgetMixin {
  final String message;
  final Color color;
  final IconData icon;

  ConnectionStatusView({
    super.key,
    required this.message,
    required this.color,
    required this.icon,
  });

  @override
  Widget body(BuildContext context) {
    return Container(
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getIcon(),
          SizedBox(width: AppValues.margin_4.w),
          _getText(),
        ],
      ),
    );
  }

  Widget _getIcon() {
    return Icon(
      icon,
      size: AppValues.iconSize_14.r,
    );
  }

  Widget _getText() {
    return Flexible(
      child: Text(
        message,
        style: textTheme.labelSmall,
      ),
    );
  }
}
