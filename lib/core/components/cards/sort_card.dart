import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class SortCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onTap;

  const SortCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: context.colors.secondary,
                  width: border,
                )
              : null,
          color: context.colors.primaryContainer,
          borderRadius: BorderRadius.circular(circle),
        ),
        child: Padding(
          padding: EdgeInsets.all(isSelected ? 8 : 10),
          child: Text(
            text,
            style: context.textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
