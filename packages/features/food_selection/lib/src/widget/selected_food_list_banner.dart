import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SelectedFoodListBanner extends StatelessWidget {
  const SelectedFoodListBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FoodSelectionBloc, FoodSelectionState,
            List<SelectedFoodCM>>(
        selector: (state) => state.selectedFoodsList,
        builder: ((context, listSelectedFood) {
          final energySum = listSelectedFood.fold(
              0,
              (prev, current) =>
                  prev + (current.totalWeight * current.food.calorie).toInt());
          final carbohydrateSum = listSelectedFood.fold(
              0.0,
              (prev, current) =>
                  prev + current.food.macroNutrition.carbohydrate);
          final fatSum = listSelectedFood.fold(
              0.0, (prev, current) => prev + current.food.macroNutrition.fat);
          final proteinSum = listSelectedFood.fold(0.0,
              (prev, current) => prev + current.food.macroNutrition.protein);
          final sum = carbohydrateSum + fatSum + proteinSum;
          final carbPercent = carbohydrateSum / sum;
          final fatPercent = fatSum / sum;
          final proteinPercent = proteinSum / sum;
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TotalNutitionsPieChart(
                    fat: fatPercent,
                    carbohydrate: carbPercent,
                    protein: proteinPercent,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${context.l10n.selectedFoodListBannerLabelEnergy} $energySum '),
                      Row(
                        children: [
                          const _ChartLegend(color: CustomColor.carbohydrate),
                          Text(
                              '${context.l10n.nutritionDataCarbohydrateLabel} ${context.l10n.foodDataPercentValue(carbPercent)} '),
                        ],
                      ),
                      Row(
                        children: [
                          const _ChartLegend(color: CustomColor.fat),
                          Text(
                              '${context.l10n.nutritionDataFatLabel} ${context.l10n.foodDataPercentValue(fatPercent)} '),
                        ],
                      ),
                      Row(
                        children: [
                          const _ChartLegend(color: CustomColor.protein),
                          Text(
                              '${context.l10n.nutritionDataProteinLabel} ${context.l10n.foodDataPercentValue(proteinPercent)} '),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}

class _ChartLegend extends StatelessWidget {
  const _ChartLegend({
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 8,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
