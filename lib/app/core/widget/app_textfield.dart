import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/base_widget_mixin.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget with BaseWidgetMixin {
  AppTextField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.borderRadius = 8,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.prefix,
      this.suffix,
      this.validator,
      required this.onChanged,
      this.isEnabled})
      : super(key: key) {
    _isObscured = RxBool(obscureText);
  }

  final TextEditingController controller;
  late String labelText;
  final double borderRadius;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;
  final Function(String?) onChanged;
  final String hintText;
  final bool? isEnabled;

  late final RxBool _isObscured;

  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: theme.textTheme.labelLarge),
        const SizedBox(
          height: AppValues.halfPadding,
        ),
        Obx(() => TextFormField(
              enabled: isEnabled,
              controller: controller,
              onChanged: onChanged,
              decoration: _buildInputDecoration(context),
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              obscureText: _isObscured.value,
              validator: validator,
              keyboardType: keyboardType,
            ))
      ],
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: hintText,
      alignLabelWithHint: true,
      fillColor: theme.colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      label: FittedBox(child: Text(labelText)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(width: 1)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide:
            BorderSide(color: theme.textTheme.labelLarge!.color!, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: AppColors.primary, width: 3),
      ),
      suffixIcon: obscureText
          ? GestureDetector(
              onTap: () {
                _isObscured.value = !_isObscured.value;
              },
              child: _isObscured.value
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            )
          : suffix,
      prefixIcon: prefix,
    );
  }
}
