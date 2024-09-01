import 'package:core/styles/colors/light_colors.dart';
import 'package:core/styles/colors/main_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    super.key,
    this.onPressed ,
    this.text = "NEXT",
    this.child,
  });

  Function()? onPressed;
  String text;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 200,
      decoration: BoxDecoration(
        gradient: onPressed == null
            ? LightColors.disabledButtonColor
            : LightColors.primaryButtonColorEnabled,
        borderRadius: BorderRadius.circular(100),
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
