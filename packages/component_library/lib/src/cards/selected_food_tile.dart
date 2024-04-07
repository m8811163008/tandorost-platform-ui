import 'package:component_library/component_library.dart' hide PieChart;

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SelectedFoodListTile extends StatelessWidget {
  const SelectedFoodListTile({super.key, required this.selectedFood});
  final SelectedFood selectedFood;

  @override
  Widget build(BuildContext context) {
    final macroNutrition = selectedFood.macroNutrition;
    final title = selectedFood.name;
    final unitOfMeasurement = context.l10n
        .unitOfMeasurementTitle(selectedFood.unitOfMeasurement.type.name);
    final count = selectedFood.measurementUnitCount;

    return SizedBox(
      child: Card(
        child: ListTile(
          // minLeadingWidth: 104,
          isThreeLine: true,
          title: Text(
            '$count $unitOfMeasurement $title',
          ),
          leading: _SelectedFoodListTilePieChart(
            macroNutrition: macroNutrition,
          ),
          subtitle: _buildSubtitle(context),
        ),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final selectedFoodCalarieLabel =
        '${selectedFood.calculateActualCalorie()} ${context.l10n.foodDataCalarieLabel}';
    final selectedFoodFatLabel =
        '${context.l10n.foodDataPercentValue(selectedFood.macroNutrition.fatPercent)} ${context.l10n.nutritionDataFatLabel}';
    final selectedFoodProteinLabel =
        '${context.l10n.foodDataPercentValue(selectedFood.macroNutrition.proteinPercent)} ${context.l10n.nutritionDataProteinLabel}';
    final selectedFoodCarbohydrateLabel =
        '${context.l10n.foodDataPercentValue(selectedFood.macroNutrition.carbohydratePercent)} ${context.l10n.nutritionDataCarbohydrateLabel}';

    final localTime = selectedFood.selectedDate.toLocal();
    final dateFormatter = localTime.toJalali().formatter;
    final date =
        '${dateFormatter.yyyy}/${dateFormatter.mm}/${dateFormatter.dd}';
    final time =
        '${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(selectedFoodCalarieLabel),
                const Spacer(),
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
                const Spacer(),
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
          context.l10n.selectedFoodTileEatDateValue(time, date),
          style: context.themeData.textTheme.labelSmall,
        ),
      ],
    );
  }
}

class _SelectedFoodListTilePieChart extends StatelessWidget {
  const _SelectedFoodListTilePieChart({required this.macroNutrition});
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
            'پروتئین': macroNutrition.proteinPercent,
            'چربی': macroNutrition.fatPercent,
            'کربوهیدات': macroNutrition.carbohydratePercent,
          },
          ringStrokeWidth: 16,
          chartValuesOptions: const ChartValuesOptions(showChartValues: false),
          animationDuration: Duration.zero,
          legendOptions: const LegendOptions(showLegends: false),
          totalValue: 1,
          colorList: const [
            CustomColor.protein,
            CustomColor.fat,
            CustomColor.carbohydrate,
          ],
        ),
      ),
    );
  }
}
