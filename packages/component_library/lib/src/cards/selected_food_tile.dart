import 'package:component_library/component_library.dart' hide PieChart;

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SelectedFoodListTile extends StatelessWidget {
  const SelectedFoodListTile(
      {super.key,
      required this.selectedFood,
      required this.selectedFoodFoodCM,
      required this.selectedFoodUnitOfMeasurement,
      this.onTap,
      this.onLongTap,
      this.isSelected = false});
  final SelectedFoodCM selectedFood;
  final FoodCM selectedFoodFoodCM;
  final UnitOfMeasurement selectedFoodUnitOfMeasurement;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final macroNutrition = selectedFoodFoodCM.macroNutrition;
    final title = selectedFoodFoodCM.name;
    final unitOfMeasurement = context.l10n
        .unitOfMeasurementTitle(selectedFoodUnitOfMeasurement.title.name);
    final count = selectedFood.numberOfUnitOfMeasurement;

    return SizedBox(
      child: Card(
        color:
            isSelected ? context.themeData.colorScheme.tertiaryContainer : null,
        child: ListTile(
          // minLeadingWidth: 104,
          selected: isSelected,
          isThreeLine: true,
          title: Text(
            '$count $unitOfMeasurement $title',
          ),
          leading: _SelectedFoodListTilePieChart(
            macroNutrition: macroNutrition,
          ),
          subtitle: _buildSubtitle(context),
          onLongPress: onLongTap,
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final selectedFoodCalarieLabel =
        '${selectedFood.totalWeight * selectedFoodFoodCM.calorie} ${context.l10n.foodDataCalarieLabel}';
    final macroNutrition = selectedFoodFoodCM.macroNutrition;
    final selectedFoodFatLabel =
        '${context.l10n.foodDataPercentValue(macroNutrition.fat / macroNutrition.totalWeight)} ${context.l10n.nutritionDataFatLabel}';
    final selectedFoodProteinLabel =
        '${context.l10n.foodDataPercentValue(macroNutrition.protein / macroNutrition.totalWeight)} ${context.l10n.nutritionDataProteinLabel}';
    final selectedFoodCarbohydrateLabel =
        '${context.l10n.foodDataPercentValue(macroNutrition.carbohydrate / macroNutrition.totalWeight)} ${context.l10n.nutritionDataCarbohydrateLabel}';

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
  final MacroNutritionCM macroNutrition;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: SizedBox.square(
        dimension: 128,
        child: PieChart(
          chartType: ChartType.ring,
          dataMap: {
            'پروتئین': macroNutrition.protein / macroNutrition.totalWeight,
            'چربی': macroNutrition.fat / macroNutrition.totalWeight,
            'کربوهیدات':
                macroNutrition.carbohydrate / macroNutrition.totalWeight,
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
