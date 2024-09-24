import 'package:Dinar/src/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/src/features/categories/domain/entities/category.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors/light_colors.dart';
import '../../../../core/styles/colors/main_colors.dart';

class CategoryItemHorizontal extends StatelessWidget {
  final Category category;

  const CategoryItemHorizontal({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 120,
      decoration: BoxDecoration(
        gradient: LightColors.widgetCardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MainColors.teaGreen),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "category.name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "income",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Center(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "total : 12120012",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
