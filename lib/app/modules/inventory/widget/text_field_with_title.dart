import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/app_values.dart';

// ignore: must_be_immutable
class TextFieldWithTitle extends StatelessWidget with BaseWidgetMixin {
  final TextEditingController controller;
  final String? title;
  final Function(String)? onChangedValue;

  TextFieldWithTitle({
    required this.controller,
    this.title,
    this.onChangedValue,
    Key? key,
  });

  @override
  Widget body(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (title.isNotNullOrEmpty)
          Expanded(
            child: Text(
              title ?? '',
              style: textTheme.bodyMedium,
            ),
          ),
        if (title.isNotNullOrEmpty) const SizedBox(width: AppValues.margin_10),
        SizedBox(
          width: AppValues.margin_40.w,
          height: AppValues.margin_30.w,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            minLines: 1,
            onTap: () {
              controller.selection = TextSelection(
                  baseOffset: 0, extentOffset: controller.text.length);
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: theme.colorScheme.surface,
              contentPadding: const EdgeInsets.all(4),
              counterText: '',
            ),
            maxLength: AppValues.maxCountLength,
            onChanged: onChangedValue,
          ),
        )
      ],
    );
  }
}
