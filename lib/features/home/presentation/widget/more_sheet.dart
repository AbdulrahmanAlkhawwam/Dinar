import 'package:flutter/material.dart';

import '../../../../core/components/buttons/float_button.dart';
import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/utils/app_context.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../history/presentation/pages/history_screen.dart';
import '../../../operations/presentation/pages/add_operation_screen.dart';

class MoreSheet extends StatelessWidget {
  const MoreSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.onSurface.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 48),
        child: Column(
          children: [
            const Spacer(),
            PrimaryButton(
              text: ("Add income"),
              onPressed: () => context.push(
                MaterialPageRoute(
                  builder: (context) => AddOperationScreen(
                    type: OperationType.income,
                  ),
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(
                text: ("Add payment"),
                onPressed: () => context.push(
                      MaterialPageRoute(
                        builder: (context) => AddOperationScreen(
                          type: OperationType.payment,
                        ),
                      ),
                    )),
            const Spacer(),
            PrimaryButton(
              text: ("Show history"),
              onPressed: () => context
                  .push(
                    MaterialPageRoute(
                      builder: (context) => HistoryScreen(),
                    ),
                  )
                  .then((value) => context.pop()),
            ),
            const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(top: 32),
            //   child: FloatButton(
            //     onPressed: () => context.pop(),
            //     text: "Less",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
