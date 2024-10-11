import '../../../../core/components/cards/tag_card.dart';
import '../../../../core/utils/app_context.dart';
import '../../../incomes/domain/entities/income.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class IncomeItem extends StatelessWidget {
  final Income income;

  const IncomeItem({
    super.key,
    required this.income,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.onSecondary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.colors.primary.withOpacity(0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          income.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        income.description != null
                            ? Text(
                                "description : ${income.description}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              )
                            : const SizedBox(),
                        Text(
                          "date : ${DateFormat.yMMMMd().format(income.date)}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "value : ${income.value}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {}, // we not do delete function yet
                    icon: Icon(
                      Icons.delete_outline,
                      color: context.colors.error,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: Row(
                  children: [
                    TagCard(
                      operationType: income.type,
                      text: "category",
                    ),
                    const SizedBox(width: 16),
                    TagCard(
                      operationType: income.type,
                      text: "wallet",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
