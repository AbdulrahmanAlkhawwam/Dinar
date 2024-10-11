import 'package:flutter/material.dart';

import '../../../features/app/domain/entities/operation_type.dart';
import '../../constants/styles.dart';
import '../../utils/app_context.dart';

class TagCard extends StatelessWidget {
  /// this variable is made for know what is the color of [card]
  /// if [operationType] is equal [income] this mean it will be green color
  /// if [operationType] is equal [payment] this mean it will be red color
  final OperationType operationType;

  /// this [text] is the text which written on [card]
  final String text;

  const TagCard({
    super.key,
    required this.operationType,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final color = operationType == OperationType.income
        ? context.colors.inversePrimary
        : context.colors.errorContainer;

    return Container(
      /// fixed size
      height: 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(circle),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 5,
              backgroundColor: context.colors.onSecondary,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: operationType == OperationType.income
                    ? context.colors.primary
                    : context.colors.error,
                fontWeight: FontWeight.bold,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
