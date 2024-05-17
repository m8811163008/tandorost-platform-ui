import 'package:component_library/component_library.dart' hide PieChart;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

class TotalNutitionsPieChartNonFatPaid extends StatelessWidget {
  const TotalNutitionsPieChartNonFatPaid({
    super.key,
    required this.protein,
    required this.carbohydrateNonVegetableRemaining,
    required this.carbohydrateVegetableRemaining,
    required this.proteinRemaining,
    required this.carbohydrateNonVegetable,
    required this.carbohydrateVegetable,
  });

  final double protein;
  final double proteinRemaining;
  final double carbohydrateNonVegetableRemaining;
  final double carbohydrateNonVegetable;
  final double carbohydrateVegetableRemaining;
  final double carbohydrateVegetable;

  @override
  Widget build(BuildContext context) {
    final proteinRemainingVal = proteinRemaining < 0 ? 0.0 : proteinRemaining;
    final carbohydrateNonVegetableRemainingVal =
        carbohydrateNonVegetableRemaining < 0
            ? 0.0
            : carbohydrateNonVegetableRemaining;
    final carbohydrateVegetableRemainingVal = carbohydrateVegetableRemaining < 0
        ? 0.0
        : carbohydrateVegetableRemaining;
    return SizedBox.square(
      dimension: 96,
      child: PieChart(
        chartType: ChartType.ring,
        dataMap: {
          'پروتئین': protein,
          'باقی مانده پروتئین': proteinRemainingVal,
          'کربوهیدرات غنی': carbohydrateNonVegetable,
          'باقی مانده کربوهیدرات غنی': carbohydrateNonVegetableRemainingVal,
          'کربوهیدرات میوه و سبزی': carbohydrateVegetable,
          'باقی مانده کربوهیدرات میوه و سبزی':
              carbohydrateVegetableRemainingVal,
        },
        ringStrokeWidth: 32,
        chartValuesOptions: const ChartValuesOptions(showChartValues: false),
        animationDuration: Duration(milliseconds: 500),
        legendOptions: const LegendOptions(showLegends: false),
        totalValue: protein +
            proteinRemainingVal +
            carbohydrateNonVegetableRemainingVal +
            carbohydrateNonVegetable +
            carbohydrateVegetableRemainingVal +
            carbohydrateVegetable,
        colorList: [
          CustomColor.protein,
          CustomColor.protein.withOpacity(0.2),
          CustomColor.carbohydrateNonFruitVegetable,
          CustomColor.carbohydrateNonFruitVegetable.withOpacity(0.2),
          CustomColor.carbohydrateFruitVegetable,
          CustomColor.carbohydrateFruitVegetable.withOpacity(0.2),
        ],
      ),
    );
  }
}

class TotalNutitionsPieChartFatPaid extends StatelessWidget {
  const TotalNutitionsPieChartFatPaid({
    super.key,
    required this.fatRemaining,
    required this.fat,
  });
  final double fatRemaining;
  final double fat;

  @override
  Widget build(BuildContext context) {
    final fatRemainingVal = fatRemaining < 0 ? 0.0 : fatRemaining;
    return SizedBox.square(
      dimension: 144,
      child: PieChart(
        chartType: ChartType.ring,
        dataMap: {
          'چربی': fat,
          'باقی مانده چربی': fatRemainingVal,
        },
        ringStrokeWidth: 8,
        chartValuesOptions: const ChartValuesOptions(showChartValues: false),
        animationDuration: Duration(milliseconds: 500),
        legendOptions: const LegendOptions(showLegends: false),
        totalValue: fat + fatRemaining,
        colorList: [
          CustomColor.fat,
          CustomColor.fat.withOpacity(0.2),
        ],
      ),
    );
  }
}
