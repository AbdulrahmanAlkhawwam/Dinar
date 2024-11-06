import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../utils/app_context.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final String text;
  final String? massage;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.child,
    this.massage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 200,
      decoration: BoxDecoration(
        gradient: onPressed == null
            ? context.gradient.fixedDisabledColor
            : context.gradient.fixedPrimaryColor,
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
              : context.colors.secondary,
          onTap: onPressed ?? () => context.showErrorSnackBar(massage: massage),
          child: Container(
            alignment: Alignment.center,
            child: child ??
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: onPressed == null
                        ? context.colors.outline
                        : context.colors.onPrimary,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
