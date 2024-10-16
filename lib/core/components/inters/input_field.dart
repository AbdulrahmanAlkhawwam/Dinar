import 'package:flutter/material.dart';

import '../../utils/app_context.dart';

class InputField extends StatelessWidget {
  /// this function is do some thing when [InputField] clicked
  /// this variable is Nullable ... so you can put [Null] or [Function]
  final Function()? onTap;

  /// this function is called when value of controller is changed
  /// this function get value of controller to do what you want when it changed
  /// this variable is Nullable ... so you can put [Null] or [Function]
  final Function(dynamic)? onChanged;

  /// [validator] is a function which take you a value of controller
  ///
  /// in this function you can check for some useCase for input value
  ///
  /// this variable is Nullable ... but you should use one of [validator] and
  /// [validate]
  final FormFieldValidator<dynamic>? validator;
  final String? validate;

  /// this variable take you a wide control by Text Form Field input value
  ///
  /// you can get value by controller [controller.text] or by [onChanged]
  /// function
  final TextEditingController? controller;

  /// this IconButton is appear in left of text inter if [ltr] {left to right}
  /// , and right of it if [rtl] {right to left}
  ///
  /// The [suffix] appears before the [suffixIcon], if both are specified
  /// --copy from flutter documentation ©--
  ///
  /// this variable get Icon Button which do some thing when clicked ... but
  /// you should use one of [suffixIcon] and [suffixIconButton]
  final IconButton? suffixIconButton;

  /// this is same of the previous variable [suffixIconButton] but when clicked
  /// not do any thing
  final Icon? suffixIcon;

  /// this IconButton is appear in right of text inter if [ltr] {left to right}
  /// , and left of it if [rtl] {right to left}
  ///
  /// The [prefix] appears before the [prefixIcon], if both are specified
  /// --copy from flutter documentation ©--
  ///
  /// this variable get Icon Button which do some thing when clicked ... but
  /// you should use one of [prefixIcon] and [prefixIconButton]
  final IconButton? prefixIconButton;

  /// this is same of the previous variable [prefixIconButton] but when clicked
  /// not do any thing
  final Icon? prefixIcon;

  /// this variable made for the time which you want to input only [Integer] ,
  /// [Characters] , [password] ... etc
  ///
  /// it's Nullable . so, the initial value is [text]
  final TextInputType? keyboardType;

  /// hint style is the style of [text] which appear before Tap on text inter
  ///
  /// If null, defaults to a value derived from the base [TextStyle] for the
  /// input field and the current [Theme].
  final TextStyle? hintStyle;
  final String? hint;

  /// if Text Form Field is Not enabled so , this mean you can't use it
  final bool isEnabled;

  const InputField({
    super.key,
    required this.isEnabled,
    this.controller,
    this.hint,
    this.hintStyle,
    this.suffixIconButton,
    this.suffixIcon,
    this.prefixIconButton,
    this.prefixIcon,
    this.onChanged,
    this.onTap,
    this.validate,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 18,
      keyboardType: keyboardType ?? TextInputType.text,
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
      cursorColor: context.colors.onSurface,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: !isEnabled
            ? TextStyle(
                color: context.colors.outline,
                fontSize: 18,
              )
            : null,
        suffix: suffixIconButton ?? suffixIcon,
        prefix: prefixIconButton ?? prefixIcon,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
      ),
    );
  }
}
