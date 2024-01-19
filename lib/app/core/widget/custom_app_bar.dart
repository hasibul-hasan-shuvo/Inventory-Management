import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/widget/app_bar_title.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final Widget? centerImage;

  CustomAppBar({
    Key? key,
    this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
    this.centerImage,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      elevation: 2.0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      centerTitle: centerImage != null,
      iconTheme: theme.appBarTheme.iconTheme,
      title: centerImage??AppBarTitle(text: appBarTitleText??''),
    );
  }
}
