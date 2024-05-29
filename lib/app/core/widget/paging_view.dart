import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef OnPagingViewAction = Function();

///ignore: must_be_immutable
class PagingView extends StatelessWidget with BaseWidgetMixin {
  final RefreshController controller;
  final Widget child;
  final bool enablePullDown;
  final bool enablePullUp;
  final OnPagingViewAction? onLoading;
  final OnPagingViewAction? onRefresh;
  Axis? scrollDirection;
  bool? reverse;

  PagingView({
    Key? key,
    required this.controller,
    required this.child,
    this.enablePullDown = true,
    this.enablePullUp = false,
    this.onRefresh,
    this.onLoading,
    this.scrollDirection,
  });

  @override
  Widget body(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      header: _header,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      onRefresh: onRefresh,
      onLoading: onLoading,
      scrollDirection: scrollDirection,
      reverse: reverse,
      child: child,
    );
  }

  Widget get _header => MaterialClassicHeader(
        color: theme.colorScheme.primary,
        backgroundColor: theme.cardColor,
      );
}
