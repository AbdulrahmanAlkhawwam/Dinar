import 'package:flutter/material.dart';

import '../../utils/app_context.dart';

class ClearButton extends StatelessWidget {
  /// [onPressed] we added for two thing :-
  ///   1. for do some thing when you click button
  ///   2. for DISABLED button when you don't want to do some thing
  final Function()? onPressed;

  /// we added [child] if you want to add Row not a Text
  /// like Icon with Text but we not support it as Item we support it as Row
  final Widget? child;
  final String? text;

  const ClearButton({
    super.key,
    this.onPressed,
    this.child,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      /// fixed size
      height: 48,
      width: 200,
      child: Material(
        type: MaterialType.button,
        color: Colors.transparent,
        shape: const StadiumBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: context.colors.onPrimary,
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            child: child ??
                Text(
                  text ?? "Back",
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    /// we use IF condition here to appear if it DISABLED or not
                    color: onPressed == null
                        ? context.colors.outlineVariant
                        : context.colors.onTertiaryFixed,
                    fontSize: 18,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
