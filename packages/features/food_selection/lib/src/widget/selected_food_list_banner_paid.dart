import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_selection/src/selected_foods_list/cubit/selected_foods_list_cubit.dart';

class SelectedFoodListBannerPaid extends StatelessWidget {
  const SelectedFoodListBannerPaid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
        SelectedFoodsListCubit,
        SelectedFoodsListState,
        ({
          DietInfo dietInfo,
          SelectedFoodsInfo selectedFoodsInfo,
          DayActivityLevel dayActivityLevel,
          DateTimeRange filterSelctedFoodsListDateTimeRange,
          int filterDays,
        })>(
      selector: (state) => (
        dietInfo: state.dietInfo,
        selectedFoodsInfo: state.selectedFoodsInfo,
        dayActivityLevel: state.dayActivityLevel,
        filterSelctedFoodsListDateTimeRange:
            state.filterSelctedFoodsListDateTimeRange,
        filterDays: state.filterDays,
      ),
      builder: ((context, p0) {
        final macroNutritionRequirements =
            p0.dietInfo.macroNutritionRequirements(p0.dayActivityLevel);
        // ceil the days to include last 24 hours in calculation because our calculation is base on 24 hours of RMR.
        final filterDays = p0.filterDays;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                                '${context.l10n.selectedFoodListBannerLabelEnergy} ${p0.selectedFoodsInfo.totalEnergy}  از ${filterDays * macroNutritionRequirements.effectiveTotalDailyEnergyExpenditure} کیلوکالری'),
                            if (p0.selectedFoodsInfo.totalEnergy >
                                macroNutritionRequirements
                                    .effectiveTotalDailyEnergyExpenditure)
                              Icon(
                                Ionicons.warning,
                                color: context.themeData.colorScheme.error,
                              )
                          ],
                        ),
                        ProgressIndicator(
                            value: p0.selectedFoodsInfo.totalEnergy /
                                (filterDays *
                                    macroNutritionRequirements
                                        .effectiveTotalDailyEnergyExpenditure),
                            color: context.themeData.colorScheme.primary),
                        SizedBox(
                          height: context.sizesExtenstion.small,
                        ),
                        Row(
                          children: [
                            const _ChartLegend(
                                color:
                                    CustomColor.carbohydrateNonFruitVegetable),
                            Text(
                                '${'کربوهیدرات غنی'}  ${p0.selectedFoodsInfo.carbohydrateNonFruitVegerable.toStringAsFixed(1)}  از ${(filterDays * macroNutritionRequirements.carbohydrateNonFruitVegetable).toStringAsFixed(0)} گرم'),
                            if (p0.selectedFoodsInfo
                                    .carbohydrateNonFruitVegerable >
                                macroNutritionRequirements
                                    .carbohydrateNonFruitVegetable)
                              Icon(
                                Ionicons.warning,
                                color: context.themeData.colorScheme.error,
                              )
                          ],
                        ),
                        ProgressIndicator(
                          value: p0.selectedFoodsInfo
                                  .carbohydrateNonFruitVegerable /
                              (filterDays *
                                  macroNutritionRequirements
                                      .carbohydrateNonFruitVegetable),
                          color: CustomColor.carbohydrateNonFruitVegetable,
                        ),
                        SizedBox(
                          height: context.sizesExtenstion.small,
                        ),
                        Row(
                          children: [
                            const _ChartLegend(
                                color: CustomColor.carbohydrateFruitVegetable),
                            Text(
                                '${'کربوهیدرات میوه و سبزی'} ${p0.selectedFoodsInfo.carbohydrateFruitVegerable.toStringAsFixed(1)}  از ${(filterDays * macroNutritionRequirements.carbohydrateFruitVegetable).toStringAsFixed(0)} گرم'),
                            if (p0.selectedFoodsInfo
                                    .carbohydrateFruitVegerable >
                                macroNutritionRequirements
                                    .carbohydrateFruitVegetable)
                              Icon(
                                Ionicons.warning,
                                color: context.themeData.colorScheme.error,
                              )
                          ],
                        ),
                        ProgressIndicator(
                          value:
                              p0.selectedFoodsInfo.carbohydrateFruitVegerable /
                                  (filterDays *
                                      macroNutritionRequirements
                                          .carbohydrateFruitVegetable),
                          color: CustomColor.carbohydrateFruitVegetable,
                        ),
                        SizedBox(
                          height: context.sizesExtenstion.small,
                        ),
                        Row(
                          children: [
                            const _ChartLegend(color: CustomColor.fat),
                            Text(
                                '${context.l10n.nutritionDataFatLabel} ${p0.selectedFoodsInfo.fat.toStringAsFixed(1)}  از ${(filterDays * macroNutritionRequirements.fat).toStringAsFixed(0)} گرم'),
                            if (p0.selectedFoodsInfo.fat >
                                macroNutritionRequirements.fat)
                              Icon(
                                Ionicons.warning,
                                color: context.themeData.colorScheme.error,
                              )
                          ],
                        ),
                        ProgressIndicator(
                          value: p0.selectedFoodsInfo.fat /
                              (filterDays * macroNutritionRequirements.fat),
                          color: CustomColor.fat,
                        ),
                        SizedBox(
                          height: context.sizesExtenstion.small,
                        ),
                        Row(
                          children: [
                            const _ChartLegend(color: CustomColor.protein),
                            Text(
                                '${context.l10n.nutritionDataProteinLabel} ${p0.selectedFoodsInfo.protein.toStringAsFixed(1)}  از ${(filterDays * macroNutritionRequirements.protein).toStringAsFixed(0)} گرم'),
                            if (p0.selectedFoodsInfo.protein >
                                macroNutritionRequirements.protein)
                              Icon(
                                Ionicons.warning,
                                color: context.themeData.colorScheme.error,
                              )
                          ],
                        ),
                        ProgressIndicator(
                          value: p0.selectedFoodsInfo.protein /
                              (filterDays * macroNutritionRequirements.protein),
                          color: CustomColor.protein,
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      TotalNutitionsPieChartNonFatPaid(
                          protein: p0.selectedFoodsInfo.protein,
                          carbohydrateNonVegetableRemaining: filterDays *
                                  macroNutritionRequirements
                                      .carbohydrateNonFruitVegetable -
                              p0.selectedFoodsInfo
                                  .carbohydrateNonFruitVegerable,
                          carbohydrateVegetableRemaining: filterDays *
                                  macroNutritionRequirements
                                      .carbohydrateFruitVegetable -
                              p0.selectedFoodsInfo.carbohydrateFruitVegerable,
                          proteinRemaining:
                              filterDays * macroNutritionRequirements.protein -
                                  p0.selectedFoodsInfo.protein,
                          carbohydrateNonVegetable: p0
                              .selectedFoodsInfo.carbohydrateNonFruitVegerable,
                          carbohydrateVegetable:
                              p0.selectedFoodsInfo.carbohydrateFruitVegerable),
                      TotalNutitionsPieChartFatPaid(
                        fat: p0.selectedFoodsInfo.fat,
                        fatRemaining:
                            filterDays * macroNutritionRequirements.fat -
                                p0.selectedFoodsInfo.fat,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
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

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator(
      {super.key, required this.value, required this.color});
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 56,
        child: LinearProgressIndicator(
          value: value,
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
