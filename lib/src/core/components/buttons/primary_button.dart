import 'package:Dinar/src/core/utils/app_context.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../styles/colors/light_colors.dart';
import '../../styles/colors/main_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    this.text = "NEXT",
    this.child,
  });

  final Function()? onPressed;
  final String text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 200,
      decoration: BoxDecoration(
        gradient: onPressed == null
            ? LightColors.disabledButtonColor
            : LightColors.primaryButtonColorEnabled,
        borderRadius: BorderRadius.circular(circle),
      ),
      child: Material(
        type: MaterialType.button,
        color: Colors.transparent,
        shape: const StadiumBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: context.colors.secondary,
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
                        : MainColors.mintCream, //context.colors.onPrimary,
                    fontSize: 18,
                    //fontWeight: FontWeight.w500,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
