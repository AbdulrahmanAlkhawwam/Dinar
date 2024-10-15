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
  final String text;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 200,
      decoration: BoxDecoration(
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
          splashColor: onPressed == null
              ? context.colors.outline
              : context.colors.primary,
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            child: child ??
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: onPressed == null
                        ? context.colors.outline
                        : context.colors.onSecondary,
                    fontSize: 18,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
