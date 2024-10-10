/// fix linear

import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../errors/exceptions.dart';
import '../../constants/colors.dart';
import '../../utils/app_context.dart';

class LinearChart extends StatelessWidget {
  final List<FlSpot> values;
  double maxY = 0.0;
  double maxX = 0.0;
  double minY = 0.0;
  double minX = 0.0;
  double valueX = 0.0;
  double valueY = 0.0;

  LinearChart({
    super.key,
    required this.values,
  }) {
    maxY = values[0].y.toDouble();
    maxX = values[0].x.toDouble();
    minY = values[0].y.toDouble();
    minX = values[0].x.toDouble();
    _checkData(values);
    _getChartData(values);
  }

  _checkData(List<FlSpot> values) {
    double lastValue = values[0].x.toDouble();
    for (var value in values.sublist(1)) {
      if (value.x.toDouble() < lastValue.toDouble()) {
        throw ParsingException("can't parsing values");
      }
      lastValue = value.x.toDouble();
    }
    return;
  }

  _getChartData(List<FlSpot> values) {
    for (var value in values) {
      if (maxX < value.x.toInt()) {
        maxX = value.x.toDouble();
      }
      if (minX > value.x.toInt()) {
        minX = value.x.toDouble();
      }
      if (maxY < value.y.toInt()) {
        maxY = value.y.toDouble();
      }
      if (minY > value.y.toInt()) {
        minY = value.y.toDouble();
      }
    }
    valueX = _fixValue(maxX - minX);
    valueY = _fixValue(maxY - minY);
  }

  double _fixValue(value) {
    switch (value) {
      case <= 100.0:
        value = value / 5.0;
      case <= 500.0:
        value = value / 7.5;
      case <= 1000.0:
        value = value / 10.0;
      default:
        value = value / 12.50;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    LinearGradient? color = context.gradient.primaryColor;

    return InnerShadow(
      shadows: [
        BoxShadow(
          color: context.colors.surface,
          offset: const Offset(2.5, 0),
          blurRadius: 5,
        ),
        BoxShadow(
          color: context.colors.surface,
          offset: const Offset(-2.5, 0),
          blurRadius: 5,
        ),
      ],
      child: Container(
        color: context.colors.secondaryFixed,
        width: double.infinity,
        child: Center(
          child: AspectRatio(
            aspectRatio: 19 / 9,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  horizontalInterval: valueY,
                  verticalInterval: valueX,
                  checkToShowVerticalLine: (value) => false,
                  checkToShowHorizontalLine: (value) =>
                      value > 10 ? false : true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: context.colors.primary.withOpacity(0.15),
                      strokeWidth: 2,
                    );
                  },
                ),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: minX,
                maxX: maxX,
                minY: minY - valueY * 1.5,
                maxY: maxY + valueY * 1.5,
                lineBarsData: [
                  LineChartBarData(
                    spots: values,
                    isCurved: true,
                    gradient: color,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: color!.colors
                            .map((color) => color.withOpacity(0.5))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
