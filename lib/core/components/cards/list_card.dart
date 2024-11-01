import 'package:flutter/material.dart';

import '../../utils/app_context.dart';

class ListCard extends StatelessWidget {

  /// [child] which is in the card like widget
  final Widget child;

  /// [isHorizontal] is true when [Axis] is [Axis.horizontal] and is false when
  /// it's [Axis.vertical]
  final bool isHorizontal;

  const ListCard({
    super.key,
    required this.child,
    required this.isHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isHorizontal ? 24 : 0),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
