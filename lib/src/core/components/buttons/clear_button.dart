import 'package:flutter/material.dart';

import '../../styles/colors/main_colors.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
    this.onPressed,
    this.child,
    this.text = "Back",
  });

  final Function()? onPressed;
  final Widget? child ;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 200,
      child: Material(
        type: MaterialType.button,
        color: Colors.transparent,
        shape: const StadiumBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: MainColors.mintCream,
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
                        : MainColors.darkTeal, //context.colors.onPrimary,
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
