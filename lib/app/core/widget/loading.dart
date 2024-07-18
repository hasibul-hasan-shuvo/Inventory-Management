import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Loading extends StatelessWidget with BaseWidgetMixin {
  Loading({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Container(
      color: appColors.loaderBackground,
      child: Center(
        child: _getIconWithProgressIndicator(),
      ),
    );
  }

  Widget _getIconWithProgressIndicator() {
    return Stack(
      children: [
        _getProgressIndicator(),
      ],
    );
  }

  Widget _getProgressIndicator() {
    return CircularProgressIndicator(
      color: theme.colorScheme.primary,
    );
  }
}
