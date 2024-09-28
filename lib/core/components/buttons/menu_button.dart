/// fix menu button

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../styles/colors/main_colors.dart';
import '../../utils/app_context.dart';
import '../../constants/styles.dart';

class MenuButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final String text;

  const MenuButton({
    super.key,
    required this.text,
    this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: onPressed == null
            ? GradientLightColor.disabledColor
            : GradientLightColor.primaryColor,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: child ??
                        Text(
                          text,
                          textAlign: TextAlign.start,
                          style: /*context.textTheme.bodyMedium?.copyWith.*/
                              TextStyle(
                            color: onPressed == null
                                ? MainColors.lightGray
                                : MainColors.mintCream,
                            //context.colors.onPrimary,
                            fontSize: 18,
                            //fontWeight: FontWeight.w500,
                          ),
                        ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: context.colors.surface,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
