import 'package:component_library/component_library.dart';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SelectedFoodListTile extends StatelessWidget {
  const SelectedFoodListTile({super.key, required this.selectedFood});
  final SelectedFood selectedFood;

  String foodContentLabel(BuildContext context) {
    final fat = selectedFood.macroNutrition?.fat ?? 0;
    final carbohydrate = selectedFood.macroNutrition?.carbohydrate ?? 0;
    final protein = selectedFood.macroNutrition?.protein ?? 0;
    final percentConstant = 100 / (fat + carbohydrate + protein);
    final buffer = StringBuffer();
    buffer.write(selectedFood.calorie);
    buffer.write(' ');
    buffer.write(context.l10n.foodDataCalarieLabel);
    buffer.write('⚡️');
    // TODO update l10n for percent
    buffer.write(' %');
    buffer.write((fat * percentConstant).toStringAsFixed(1));
    buffer.write(' ');
    buffer.write(context.l10n.nutritionDataFatLabel);
    buffer.write(' %');
    buffer.write((carbohydrate * percentConstant).toStringAsFixed(1));
    buffer.write(' ');
    buffer.write(context.l10n.nutritionDataCarbohydrateLabel);
    buffer.write(' %');
    buffer.write((protein * percentConstant).toStringAsFixed(1));
    buffer.write(' ');
    buffer.write(context.l10n.nutritionDataProteinLabel);
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final macroNutrition = selectedFood.macroNutrition;
    final title = selectedFood.name;
    final unitOfMeasurement = 'selectedFood.unitOfMeasurement!.title';
    final count = selectedFood.measurementUnitCount!;

    final fat = selectedFood.macroNutrition?.fat ?? 0;
    final carbohydrate = selectedFood.macroNutrition?.carbohydrate ?? 0;
    final protein = selectedFood.macroNutrition?.protein ?? 0;
    final percentConstant = 1 / (fat + carbohydrate + protein);

    final selectedFoodCalarieLabel =
        '${selectedFood.calorie} ${context.l10n.foodDataCalarieLabel}⚡️';
    final selectedFoodFatLabel =
        '${context.l10n.foodDataPercentValue(fat * percentConstant)} ${context.l10n.nutritionDataFatLabel}';
    final selectedFoodProteinLabel =
        '${context.l10n.foodDataPercentValue(protein * percentConstant)} ${context.l10n.nutritionDataProteinLabel}';
    final selectedFoodCarbohydrateLabel =
        '${context.l10n.foodDataPercentValue(carbohydrate * percentConstant)} ${context.l10n.nutritionDataCarbohydrateLabel}';

    return SizedBox(
      child: Card(
        child: ListTile(
          // minLeadingWidth: 104,
          isThreeLine: true,
          title: Text(
            '$count $unitOfMeasurement $title',
          ),
          leading: macroNutrition == null
              ? null
              : _SelectedFoodListTilePieChart(
                  macroNutrition: macroNutrition,
                ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(selectedFoodCalarieLabel),
                      Spacer(),
                      Text(
                        selectedFoodFatLabel,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedFoodProteinLabel,
                      ),
                      Spacer(),
                      Text(
                        selectedFoodCarbohydrateLabel,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              Text(
                'ساعت 16:30 روز 16/17/1403',
                style: context.themeData.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectedFoodListTilePieChart extends StatelessWidget {
  const _SelectedFoodListTilePieChart(
      {super.key, required this.macroNutrition});
  final MacroNutrition macroNutrition;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: SizedBox.square(
        dimension: 128,
        child: PieChart(
          chartType: ChartType.ring,
          dataMap: {
            if (macroNutrition.protein != null)
              'پروتئین': macroNutrition.protein!,
            if (macroNutrition.fat != null) 'چربی': macroNutrition.fat!,
            if (macroNutrition.carbohydrate != null)
              'کربوهیدات': macroNutrition.fat!,
          },
          ringStrokeWidth: 16,
          chartValuesOptions: ChartValuesOptions(showChartValues: false),
          animationDuration: Duration.zero,
          legendOptions: LegendOptions(showLegends: false),
          totalValue: macroNutrition.sum,
          colorList: [
            CustomColor.protein,
            CustomColor.fat,
            CustomColor.carbohydrate,
          ],
        ),
      ),
    );
  }
}
