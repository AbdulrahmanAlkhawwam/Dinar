import 'package:Dinar/src/core/constants/styles.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../styles/colors/main_colors.dart';
import '../../styles/colors/light_colors.dart';

class SecondaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Widget? child;

  const SecondaryButton({
    super.key,
    this.onPressed,
    this.text = "ADD",
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 32,
        )
      ],
      child: Container(
        height: 48,
        width: 200,
        decoration: BoxDecoration(
          gradient: onPressed == null
              ? GradientLightColor.disabledColor
              : LightColors.secondaryButtonColorEnabled,
          borderRadius: BorderRadius.circular(circle),
        ),
        child: Material(
          type: MaterialType.button,
          color: Colors.transparent,
          shape: const StadiumBorder(),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: MainColors.teaGreen,
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              child: child ??
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: /*context.textTheme.bodyMedium?.copyWith.*/
                        TextStyle(
                      color: onPressed == null
                          ? MainColors.lightGray
                          : MainColors.darkTeal,
                      //context.colors.onPrimary,
                      fontSize: 18,
                      //fontWeight: FontWeight.w500,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
