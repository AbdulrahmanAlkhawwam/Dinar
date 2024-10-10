import 'package:Dinar/core/components/buttons/float_button.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Screen extends StatelessWidget {
  final bool withoutBackground;
  final Widget child;

  const Screen({
    super.key,
    required this.child,
    this.withoutBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        withoutBackground
            ? const SizedBox()
            : Container(
                decoration: BoxDecoration(
                  gradient: context.gradient.backgroundColor,
                ),
              ),
        child,
      ],
    );
  }
}
