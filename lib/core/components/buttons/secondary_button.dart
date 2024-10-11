import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../constants/colors.dart';
import '../../utils/app_context.dart';

class SecondaryButton extends StatelessWidget {
  /// [onPressed] we added for two thing :-
  ///   1. for do some thing when you click button
  ///   2. for DISABLED button when you don't want to do some thing
  final Function()? onPressed;

  /// we added [child] if you want to add Row not a Text
  /// like Icon with Text but we not support it as Item we support it as Row
  final Widget? child;
  final String? text;

  const SecondaryButton({
    super.key,
    this.onPressed,
    this.text,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: <Shadow>[
        BoxShadow(
          color: context.colors.shadow.withOpacity(0.33),
          blurRadius: 32,
          blurStyle: BlurStyle.inner,
          spreadRadius: 500,
        ),
      ],
      child: Container(
        /// fixed size
        height: 48,
        width: 200,
        decoration: BoxDecoration(
          /// we use IF condition here to appear if it DISABLED or not
          gradient: onPressed == null
              ? context.gradient.fixedDisabledColor
              : context.gradient.fixedSecondaryColor,
          borderRadius: BorderRadius.circular(circle),
        ),
        child: Material(
          type: MaterialType.button,
          color: Colors.transparent,
          shape: const StadiumBorder(),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: context.colors.secondaryFixed,
            onTap: onPressed,
            child: Container(
              alignment: Alignment.center,
              child: child ??
                  Text(
                    text ?? "ADD",
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      /// we use IF condition here to appear if it
                      /// DISABLED or not
                      color: onPressed == null
                          ? context.colors.outlineVariant
                          : context.colors.onTertiaryFixed,
                      fontSize: 18,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
