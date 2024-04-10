import 'dart:math';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:component_library/component_library.dart';

class AppLineChart extends StatefulWidget {
  AppLineChart({super.key, required this.bioDataCMList, this.onSpotLongPreesed})
      : assert(bioDataCMList.isNotEmpty);
  final List<BioDataCM> bioDataCMList;

  /// this value set the index of x like 0,1.
  final ValueSetter<int>? onSpotLongPreesed;

  @override
  State<AppLineChart> createState() => _AppLineChartState();
}

class _AppLineChartState extends State<AppLineChart> {
  List<Color> gradientColors = const [];

  @override
  void didChangeDependencies() {
    gradientColors = [
      context.themeData.colorScheme.secondary,
      context.themeData.colorScheme.tertiary,
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(
        mainData(),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (value.toDouble() < widget.bioDataCMList.length) {
      Widget text =
          _buildBottomTitle(widget.bioDataCMList[value.toInt()].logDate);

      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: text,
      );
    } else {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: const Text('+'),
      );
    }
  }

  Widget _buildBottomTitle(DateTime dateTime) {
    final jalai = Jalali.fromDateTime(dateTime);
    final formatter = jalai.formatter;
    return RotatedBox(
        quarterTurns: 3,
        child: Text('${formatter.yyyy}/${formatter.mm}/${formatter.dd}',
            style: context.themeData.textTheme.labelSmall));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return Text(value.toStringAsFixed(0),
        style: context.themeData.textTheme.labelSmall,
        textAlign: TextAlign.center);
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchCallback: (touchEvent, touchResponse) {
          if (touchEvent is FlLongPressStart) {
            if (touchResponse?.lineBarSpots?.first.spotIndex == null) return;
            widget.onSpotLongPreesed
                ?.call(touchResponse!.lineBarSpots!.first.spotIndex);
          }
        },
        touchTooltipData: LineTouchTooltipData(
          showOnTopOfTheChartBoxArea: true,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return null;
            }).toList();
          },
        ),
        getTouchedSpotIndicator: (barData, indicators) {
          return indicators.map((int index) {
            /// Indicator Line
            final flLine = FlLine(
              color: context.themeData.colorScheme.primary,
              strokeWidth: 0,
            );

            final dotData = FlDotData(
              getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(
                radius: 64,
                color: context.themeData.colorScheme.inversePrimary
                    .withOpacity(0.3),
              ),
            );

            return TouchedSpotIndicatorData(flLine, dotData);
          }).toList();
        },
      ),
      gridData: const FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        // parmeter
        verticalInterval: 1,

        horizontalInterval: 1,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 80,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // parmeter
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            //// parmeter
            reservedSize: 24,
          ),
        ),
      ),
      minX: 0,
      maxX: 9,
      // parmeter
      minY: widget.bioDataCMList.map((e) => e.value).reduce(min).toDouble() - 1,
      // parmeter
      maxY: widget.bioDataCMList.map((e) => e.value).reduce(max).toDouble() + 1,
      lineBarsData: [
        LineChartBarData(
          // parmeter
          spots: List.generate(
            10,
            (index) {
              if (index < widget.bioDataCMList.length) {
                final value = widget.bioDataCMList[index].value.toDouble();
                return FlSpot(index.toDouble(), value);
              }

              return FlSpot(
                index.toDouble(),
                widget.bioDataCMList.last.value.toDouble(),
              );
            },
          ),
          isCurved: false,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (flSpot, percentage, barData, index) {
              return FlDotCirclePainter(
                radius: 6,
                color: context.themeData.colorScheme.inversePrimary,
              );
            },
          ),

          // belowBarData: BarAreaData(
          //   show: true,
          //   gradient: LinearGradient(
          //     colors: gradientColors
          //         .map((color) => color.withOpacity(0.3))
          //         .toList(),
          //   ),
          // ),
        ),
      ],
    );
  }
}
