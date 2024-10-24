import 'package:Dinar/core/components/cards/empty_card.dart';
import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/features/operations/domain/entities/operation.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/charts/linear_chart.dart';
import '../manager/operation_bloc.dart';

class OperationChart extends StatelessWidget {
  final OperationType type;

  const OperationChart({
    super.key,
    required this.type,
  });

  _getTotal(DateTime date, List<Operation> operations) {
    double sum = 0;
    for (var o in operations) {
      o.type == OperationType.income
          ? o.date == date
              ? sum += o.value
              : null
          : o.date == date
              ? sum -= o.value
              : null;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationBloc, OperationState>(
      builder: (context, state) {
        if (state is OperationLoaded) {
          return state.operations
                      .where((element) => element.type == type)
                      .length >
                  7
              ? LinearChart(
                  values: [
                    FlSpot(DateTime.now().day.toDouble(),
                        _getTotal(DateTime.now(), state.operations)),
                    FlSpot(
                        DateTime.now()
                            .subtract(Duration(days: 1))
                            .day
                            .toDouble(),
                        _getTotal(DateTime.now().subtract(Duration(days: 1)),
                            state.operations)),
                    FlSpot(
                        DateTime.now()
                            .subtract(Duration(days: 2))
                            .day
                            .toDouble(),
                        _getTotal(DateTime.now().subtract(Duration(days: 2)),
                            state.operations)),
                    FlSpot(
                        DateTime.now()
                            .subtract(Duration(days: 3))
                            .day
                            .toDouble(),
                        _getTotal(DateTime.now().subtract(Duration(days: 3)),
                            state.operations)),
                    FlSpot(
                        DateTime.now()
                            .subtract(Duration(days: 4))
                            .day
                            .toDouble(),
                        _getTotal(DateTime.now().subtract(Duration(days: 4)),
                            state.operations)),
                    FlSpot(
                        DateTime.now()
                            .subtract(Duration(days: 5))
                            .day
                            .toDouble(),
                        _getTotal(DateTime.now().subtract(Duration(days: 5)),
                            state.operations)),
                    FlSpot(
                        DateTime.now()
                            .subtract(Duration(days: 6))
                            .day
                            .toDouble(),
                        _getTotal(DateTime.now().subtract(Duration(days: 6)),
                            state.operations)),
                  ],
                )
              : EmptyCard(text: "${type.name} is ");
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
