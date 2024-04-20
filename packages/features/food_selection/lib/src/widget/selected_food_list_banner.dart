import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_selection/src/selected_foods_list/cubit/selected_foods_list_cubit.dart';

class SelectedFoodListBanner extends StatelessWidget {
  const SelectedFoodListBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SelectedFoodsListCubit, SelectedFoodsListState,
            SelectedFoodsInfo>(
        selector: (state) => state.selectedFoodsInfo,
        builder: ((context, selectedFoodsInfo) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${context.l10n.selectedFoodListBannerLabelEnergy} ${selectedFoodsInfo.totalEnergy} '),
                      Row(
                        children: [
                          const _ChartLegend(color: CustomColor.carbohydrate),
                          Text(
                              '${context.l10n.nutritionDataCarbohydrateLabel} ${context.l10n.foodDataPercentValue(selectedFoodsInfo.carbPercent)} '),
                        ],
                      ),
                      Row(
                        children: [
                          const _ChartLegend(color: CustomColor.fat),
                          Text(
                              '${context.l10n.nutritionDataFatLabel} ${context.l10n.foodDataPercentValue(selectedFoodsInfo.fatPercent)} '),
                        ],
                      ),
                      Row(
                        children: [
                          const _ChartLegend(color: CustomColor.protein),
                          Text(
                              '${context.l10n.nutritionDataProteinLabel} ${context.l10n.foodDataPercentValue(selectedFoodsInfo.proteinPercent)} '),
                        ],
                      ),
                    ],
                  ),
                  TotalNutitionsPieChart(
                    fat: selectedFoodsInfo.proteinPercent,
                    carbohydrate: selectedFoodsInfo.carbPercent,
                    protein: selectedFoodsInfo.proteinPercent,
                  ),
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
