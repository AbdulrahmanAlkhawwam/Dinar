import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/colors/main_colors.dart';

extension AppNavigation on BuildContext {
  Future push(String route, {arguments}) => Navigator.pushNamed(
        this,
        route,
        arguments: arguments,
      );

  Future pushReplacement(String route, {arguments}) =>
      Navigator.pushReplacementNamed(
        this,
        route,
        arguments: arguments,
      );

  void pop([value]) => Navigator.pop(
        this,
        value,
      );
}

extension AppTheme on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
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
              "assets/svgs/success_alert.svg",
              width: massage == null ? 36 : 48,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                massage ?? "Success",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: massage == null ? 20 : 14,
                  fontWeight:
                      massage == null ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            )
          ],
        ),
        backgroundColor: colors.secondary,
      ),
    );
  }

  void showErrorSnackBar({String? massage}) {
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
              "assets/svgs/error_alert.svg",
              width: massage == null ? 36 : 48,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                massage ?? "Error",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: massage == null ? 20 : 14,
                  fontWeight:
                      massage == null ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            )
          ],
        ),
        backgroundColor: colors.errorContainer,
      ),
    );
  }

  void showWarningSnackBar({String? massage}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: MainColors.warningBorder,
            width: 3,
          ),
        ),
        duration: const Duration(seconds: 2),
        content: Row(
          children: [
            SvgPicture.asset(
              "assets/svgs/warning_alert.svg",
              width: massage == null ? 36 : 48,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                massage ?? "Warning",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: massage == null ? 20 : 14,
                  fontWeight:
                      massage == null ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            )
          ],
        ),
        backgroundColor: MainColors.warningBody,
      ),
    );
  }
}
