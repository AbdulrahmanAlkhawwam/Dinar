import 'package:Dinar/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/res.dart';

import '../styles/colors/main_colors.dart';

extension AppNavigation on BuildContext {
  Future push(Route route) => Navigator.push(
        this,
        route,
      );

  Future pushReplacement(Route route) => Navigator.pushReplacement(
        this,
        route,
      );

  void pop([value]) => Navigator.pop(
        this,
        value,
      );
}

extension AppTheme on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  GradientColor get gradient => Theme.of(this).extension<GradientColor>()!;
}

extension AppResponsive on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  String get deviceMode =>
      MediaQuery.orientationOf(this) == Orientation.landscape
          ? "landscape"
          : "portrait";

  /// bottom padding from the system, includes system nav bar
  double get bottomPadding => MediaQuery.paddingOf(this).bottom;

  /// bottom insets from the system, includes keyboard height
  double get bottomInsets => MediaQuery.viewInsetsOf(this).bottom;
}

extension AppDirectionality on BuildContext {
  TextDirection get textDirection => Directionality.of(this);
}

extension AppSnackbar on BuildContext {
  void showSuccessSnackBar({String? massage}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colors.primary,
            width: 3,
          ),
        ),
        duration: const Duration(seconds: 2),
        content: Row(
          children: [
            SvgPicture.asset(
              Res.success,
              width: 36,
              color: colors.primary,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                massage ?? "Success",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleSmall?.copyWith(
                  color: colors.primary,
                ),
              ),
            )
          ],
        ),
        backgroundColor: colors.primaryContainer,
      ),
    );
  }

  void showErrorSnackBar({String? massage}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colors.error,
            width: 3,
          ),
        ),
        duration: const Duration(seconds: 2),
        content: Row(
          children: [
            SvgPicture.asset(
              Res.error,
              width: 36,
              color: colors.error,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                massage ?? "Error",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleSmall?.copyWith(
                  color: colors.error,
                ),
              ),
            )
          ],
        ),
        backgroundColor: colors.errorContainer,
      ),
    );
  }
}
