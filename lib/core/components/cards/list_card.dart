import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final Widget child;
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
