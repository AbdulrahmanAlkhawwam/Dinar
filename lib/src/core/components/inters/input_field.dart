import 'package:flutter/material.dart';

import '../../styles/colors/main_colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.isEnabled,
    this.controller,
    this.label = "Text",
    this.labelStyle,
    this.suffixIconButton,
    this.suffixIcon,
    this.prefixIconButton,
    this.prefixIcon,
    this.onChanged,
    this.onTap,
    this.validate,
    this.validator,
  });

  final Function()? onTap;
  final Function(dynamic)? onChanged;
  final FormFieldValidator<dynamic>? validator;
  final TextEditingController? controller;
  final IconButton? suffixIconButton;
  final Icon? suffixIcon;
  final IconButton? prefixIconButton;
  final TextStyle? labelStyle;
  final Icon? prefixIcon;
  final String? label;
  final String? validate;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: isEnabled
          ? validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return validate;
                } else {
                  return null;
                }
              }
          : null,
      autocorrect: true,
      onTap: onTap,
      onChanged: onChanged,
      enabled: isEnabled,
      cursorColor: MainColors.darkTeal,
      controller: controller,
      style: const TextStyle(
        height: 0,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle?.copyWith(color: MainColors.darkTeal),
        suffix: suffixIconButton ?? suffixIcon,
        prefix: prefixIconButton ?? prefixIcon,
        border: InputBorder.none,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: MainColors.lightGray,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: MainColors.forestGreen,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: MainColors.forestGreen.withOpacity(0.5),
            width: 3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: MainColors.redwood,
            width: 3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: MainColors.redwood.withOpacity(0.5),
            width: 3,
          ),
        ),
      ),
    );
  }
}
