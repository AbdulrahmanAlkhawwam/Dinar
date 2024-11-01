import 'package:flutter/material.dart';

import '../../../features/app/domain/entities/operation_type.dart';
import '../../constants/styles.dart';
import '../../utils/app_context.dart';

class TagCard extends StatelessWidget {
  /// this variable is made for know what is the color of [card]
  /// if [operationType] is equal [operation] this mean it will be green color
  /// if [operationType] is equal [payment] this mean it will be red color
  final OperationType operationType;

  /// this [text] is the text which written on [card]
  final String text;

  /// in some time you should don't appear the tag card so this handle it
  final bool isAppear;

  const TagCard(
      {super.key,
      required this.operationType,
      required this.text,
      this.isAppear = true});

  @override
  Widget build(BuildContext context) {
    final color = operationType == OperationType.income
        ? context.colors.secondary
        : context.colors.error;

    return isAppear
        ? Container(
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
                    backgroundColor: context.colors.surface,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 12,
                      color: operationType == OperationType.income
                          ? context.colors.primaryContainer
                          : context.colors.errorContainer,
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
