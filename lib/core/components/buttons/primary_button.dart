import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
import '../../utils/app_context.dart';

class PrimaryButton extends StatelessWidget {
  /// [onPressed] we added for two thing :-
  ///   1. for do some thing when you click button
  ///   2. for DISABLED button when you don't want to do some thing
  final Function()? onPressed;

  /// we added [child] if you want to add Row not a Text
  /// like Icon with Text but we not support it as Item we support it as Row
  final Widget? child;
  final String? text;

  /// this massage was added for appear when the button is DISABLED for tell
  /// user what he/she do
  final String? massage;

  const PrimaryButton({
    super.key,
    this.onPressed,
    this.text,
    this.child,
    this.massage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /// fixed size
      height: 48,
      width: 200,
      decoration: BoxDecoration(
        /// we use IF condition here to appear if it DISABLED or not
        gradient: onPressed == null
            ? context.gradient.disabledColor
            : context.gradient.primaryColor,
        borderRadius: BorderRadius.circular(circle),
      ),
      child: Material(
        type: MaterialType.button,
        color: Colors.transparent,
        shape: const StadiumBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: context.colors.onPrimaryFixedVariant,
          onTap: onPressed ?? () => context.showErrorSnackBar(massage: massage),
          child: Container(
            alignment: Alignment.center,
            child: child ??
                Text(
                  text ?? "NEXT",
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    /// we use IF condition here to appear if it DISABLED or not
                    color: onPressed == null
                        ? context.colors.outlineVariant
                        : context.colors.primaryFixed,
                    fontSize: 18,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
