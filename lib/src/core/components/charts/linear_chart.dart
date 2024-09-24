import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/main_colors.dart';

class LinearChart extends StatelessWidget {
  LinearChart({
    super.key,
    required this.values,
    List<Color>? colors,
    LinearGradient? color,
    this.mainColor,
  }) {
    this.colors = colors ??
        [
          MainColors.darkTeal,
          MainColors.forestGreen,
        ];
    maxY = values[0].y.toDouble();
    maxX = values[0].x.toDouble();
    minY = values[0].y.toDouble();
    minX = values[0].x.toDouble();
    _checkData(values);
    _getChartData(values);
  }

  final List<FlSpot> values;
  late List<Color> colors;
  LinearGradient? color;
  final Color? mainColor;
  double maxY = 0.0;
  double maxX = 0.0;
  double minY = 0.0;
  double minX = 0.0;
  double valueX = 0.0;
  double valueY = 0.0;

  _checkData(List<FlSpot> values) {
    double lastValue = values[0].x.toDouble();
    for (var value in values.sublist(1)) {
      if (value.x.toDouble() < lastValue.toDouble()) {
        throw Exception(
            "values is not invalid current value = ${value.x} and the last value = $lastValue");
      } else {
        lastValue = value.x.toDouble();
      }
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
    return Container(
      decoration: BoxDecoration(
        color: mainColor?.withOpacity(0.2) ?? MainColors.teaGreen,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: mainColor ?? MainColors.forestGreen,
        ),
      ),
      width: double.infinity,
      child: Center(
        child: AspectRatio(
          aspectRatio: 19 / 9,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: valueY,
                  verticalInterval: valueX,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: mainColor?.withOpacity(0.5) ??
                          MainColors.forestGreen.withOpacity(0.5),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return const FlLine(
                      color: Colors.transparent,
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: const FlTitlesData(
                  show: true,
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                minX: minX,
                maxX: maxX,
                minY: minY - valueY * 1.5,
                maxY: maxY + valueY * 1.5,
                lineBarsData: [
                  LineChartBarData(
                    spots: values,
                    isCurved: true,
                    gradient: color ??
                        LinearGradient(
                          colors: colors,
                        ),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: color?.colors ??
                            colors
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

  // unused code
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12);
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  // unused code
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = "" '10K';
        break;
      case 3:
        text = "" '30k';
        break;
      case 5:
        text = "" '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  // unused code
  LineChartData mainData() {
    return LineChartData();
  }

  // unused code
  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            // getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: colors[0], end: colors[1]).lerp(0.2)!,
              ColorTween(begin: colors[0], end: colors[1]).lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: colors[0], end: colors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: colors[0], end: colors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/*SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                fontSize: 12,
                color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              ),
            ),
          ),
        ),*/
