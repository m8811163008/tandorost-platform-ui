import 'package:component_library/component_library.dart' hide PieChart;
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

class TotalNutitionsPieChart extends StatelessWidget {
  const TotalNutitionsPieChart(
      {super.key,
      required this.protein,
      required this.carbohydrate,
      required this.fat});
  final double protein;
  final double fat;
  final double carbohydrate;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 104,
      child: PieChart(
        chartType: ChartType.ring,
        dataMap: {
          'پروتئین': protein,
          'چربی': fat,
          'کربوهیدات': carbohydrate,
        },
        ringStrokeWidth: 16,
        chartValuesOptions: const ChartValuesOptions(showChartValues: false),
        animationDuration: Duration.zero,
        legendOptions: const LegendOptions(showLegends: false),
        totalValue: protein + fat + carbohydrate,
        colorList: const [
          CustomColor.protein,
          CustomColor.fat,
          CustomColor.carbohydrate,
        ],
      ),
    );
  }
}
