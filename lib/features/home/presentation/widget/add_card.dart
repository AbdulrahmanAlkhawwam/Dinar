import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/features/operations/presentation/pages/add_operation_screen.dart';
import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => context.push(
                MaterialPageRoute(
                  builder: (context) =>
                      AddOperationScreen(type: OperationType.payment),
                ),
              ),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: context.colors.errorContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "payment",
                    style: context.textTheme.titleMedium
                        ?.copyWith(color: context.colors.onErrorContainer),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: InkWell(
              onTap: () => context.push(
                MaterialPageRoute(
                  builder: (context) =>
                      AddOperationScreen(type: OperationType.income),
                ),
              ),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: context.colors.primaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "income",
                    style: context.textTheme.titleMedium
                        ?.copyWith(color: context.colors.onPrimaryContainer),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
