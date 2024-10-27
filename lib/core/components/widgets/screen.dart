import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';

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
