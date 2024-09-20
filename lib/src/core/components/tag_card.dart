import 'package:flutter/material.dart';

import '../../features/app/domain/entities/operation_type.dart';
import '../utils/app_context.dart';

class TagCard extends StatelessWidget {
  final OperationType operationType;

  final String text;

  const TagCard({
    super.key,
    required this.operationType,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final color = operationType == OperationType.income
        ? context.colors.secondary
        : context.colors.errorContainer;

    return Container(
      height: 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 4.5,
              backgroundColor: context.colors.onSecondary,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
