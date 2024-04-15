import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/src/selected_foods_list/cubit/selected_foods_list_cubit.dart';

class NutritionDescriptionRestDay extends StatelessWidget {
  const NutritionDescriptionRestDay({super.key});

  Text _buildText(String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SelectedFoodsListCubit, SelectedFoodsListState>(
          buildWhen: (previous, current) =>
              previous.dayActivityLevel != current.dayActivityLevel ||
              previous.dietInfo != current.dietInfo,
          builder: (context, state) {
            final activityLeveLable = context.l10n
                .selectedFoodsDailyActivityLevel(state.dayActivityLevel.name);
            final nutrition = state.dietInfo
                .macroNutritionRequirements(state.dayActivityLevel);
            final fivePercentCalorie =
                (nutrition.effectiveTotalDailyEnergyExpenditure * 0.05).toInt();
            final sugarCubeCount =
                nutrition.effectiveTotalDailyEnergyExpenditure * 0.05 ~/ 9;
            // 16 hour awake and should eat every 3 hours
            final proteinPerMeal = nutrition.protein ~/ (16 / 3);
            return ExpansionTile(
              title: Text(
                'خلاصه خوراک مورد نیاز',
                // style: context.themeData.textTheme.bodyLarge,
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'انرژی',
                    ),
                    _buildText(
                      context.l10n.selectedFoodsListUserNutritionRequirement(
                          activityLeveLable,
                          nutrition.effectiveTotalDailyEnergyExpenditure,
                          nutrition.protein,
                          nutrition.carbohydrateFruitVegetable,
                          nutrition.carbohydrateNonFruitVegetable,
                          nutrition.fat),
                    ),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayCarbohydrate1),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayCarbohydrate2),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayCarbohydrate3(
                            fivePercentCalorie, sugarCubeCount)),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayCarbohydrate4),
                    Divider(),
                    Text('پروتئین'),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayProtein1(
                            proteinPerMeal)),
                    _buildText(context
                        .l10n.selectedFoodsListUserNutritionRestDayProtein2),
                    _buildText(context
                        .l10n.selectedFoodsListUserNutritionRestDayProtein3),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayProtein4(
                            nutrition.protein / nutrition.weight)),
                    _buildText(context
                        .l10n.selectedFoodsListUserNutritionRestDayProtein5),
                    Divider(),
                    Text('چربی'),
                    _buildText(
                        context.l10n.selectedFoodsListUserNutritionRestDayFat1),
                    _buildText(
                        context.l10n.selectedFoodsListUserNutritionRestDayFat2),
                    _buildText(
                        context.l10n.selectedFoodsListUserNutritionRestDayFat3),
                    _buildText(
                        context.l10n.selectedFoodsListUserNutritionRestDayFat4),
                    _buildText(
                        context.l10n.selectedFoodsListUserNutritionRestDayFat5),
                    _buildText(
                        context.l10n.selectedFoodsListUserNutritionRestDayFat6),
                    Divider(),
                    Text('ویتامین و مواد معدنی'),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayVitaminsAndMineral1),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayVitaminsAndMineral2),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayVitaminsAndMineral3),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayVitaminsAndMineral4),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayVitaminsAndMineral5),
                    Divider(),
                    Text('آب رسانی'),
                    _buildText(context
                        .l10n.selectedFoodsListUserNutritionRestDayHydration1),
                    _buildText(context
                        .l10n.selectedFoodsListUserNutritionRestDayHydration2),
                    _buildText(context
                        .l10n.selectedFoodsListUserNutritionRestDayHydration3),
                    _buildText(context.l10n
                        .selectedFoodsListUserNutritionRestDayHydration4(
                            state.dietInfo.isMale ? 2.5 : 2.0)),
                  ],
                )
                // const UserDescriptiveProfile(),
              ],
            );
          },
        ),
      ),
    );
  }
}
