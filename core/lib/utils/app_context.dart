import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  void showSuccessSnackBar(String? massage) {}
  void showErrorSnackBar (String? massage) {}
  void showWarningSnackBar (String? massage){}
}
