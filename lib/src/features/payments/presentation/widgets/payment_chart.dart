import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/charts/linear_chart.dart';

class PaymentChart extends StatelessWidget {
  const PaymentChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearChart(
      values: const [
        FlSpot(0, 7),
        FlSpot(2.6, 2),
        FlSpot(4.9, 5),
        FlSpot(6.8, 3),
        FlSpot(8, 4),
        FlSpot(9.5, 3),
        FlSpot(11, 3),

        /// القيم المدخلة
      ],
    );
  }
}
