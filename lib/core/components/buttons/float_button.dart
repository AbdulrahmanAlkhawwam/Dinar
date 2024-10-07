import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
import '../../utils/app_context.dart';

class FloatButton extends StatelessWidget {
  /// [onPressed] we added for two thing :-
  ///   1. for do some thing when you click button
  ///   2. for DISABLED button when you don't want to do some thing
  final Function() onPressed;

  /// we added [text] which will appear on the button
  final String text;

  /// thi

  const FloatButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /// fixed size
      height: 48,
      width: 120,
      decoration: BoxDecoration(
        /// we use IF condition here to appear if it DISABLED or not
        gradient: GradientLightColor.floatColor,
        borderRadius: BorderRadius.circular(circle),
      ),
      child: Material(
        type: MaterialType.button,
        color: Colors.transparent,
        shape: const StadiumBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: context.colors.primary,
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.tertiaryFixedDim,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
