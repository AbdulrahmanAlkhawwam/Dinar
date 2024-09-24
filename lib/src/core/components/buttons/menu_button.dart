import 'package:Dinar/src/core/utils/app_context.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/light_colors.dart';
import '../../styles/colors/main_colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.text,
    this.child,
    this.onPressed,
  });

  final Function()? onPressed;
  final String text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
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
