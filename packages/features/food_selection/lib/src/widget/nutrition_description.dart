import 'package:component_library/component_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              title: const Text(
                'خلاصه خوراک مورد نیاز',
                // style: context.themeData.textTheme.bodyLarge,
              ),
              children: [
                MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.linear(1.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
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
                      const Divider(),
                      const Text('پروتئین'),
                      _buildText(context
                          .l10n.selectedFoodsListUserNutritionRestDayProtein6),
                      _buildText(context
                          .l10n.selectedFoodsListUserNutritionRestDayProtein7),
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
                      const Divider(),
                      const Text('چربی'),
                      _buildText(context
                          .l10n.selectedFoodsListUserNutritionRestDayFat1),
                      _buildText(context
                          .l10n.selectedFoodsListUserNutritionRestDayFat2),
                      _buildText(context
                          .l10n.selectedFoodsListUserNutritionRestDayFat3),
                      _buildText(context
                          .l10n.selectedFoodsListUserNutritionRestDayFat4),
                      _buildText(context
                          .l10n.selectedFoodsListUserNutritionRestDayFat5),
                      _buildText(context
                          .l10n.selectedFoodsListUserNutritionRestDayFat6),
                      const Divider(),
                      const Text('ویتامین و مواد معدنی'),
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
                      const Divider(),
                      const Text('آب رسانی'),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionRestDayHydration1),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionRestDayHydration2),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionRestDayHydration3),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionRestDayHydration4(
                              state.dietInfo.isMale ? 2.5 : 2.0)),
                    ],
                  ),
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

class NutritionDescriptionExcerciseDayProtein extends StatelessWidget {
  const NutritionDescriptionExcerciseDayProtein({super.key});

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

            return ExpansionTile(
              title: const Text(
                'انرژی و پروتئین',
                // style: context.themeData.textTheme.bodyLarge,
              ),
              children: [
                MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.linear(1.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('انرژی'),
                      _buildText(
                        context.l10n.selectedFoodsListUserNutritionRequirement(
                            activityLeveLable,
                            nutrition.effectiveTotalDailyEnergyExpenditure,
                            nutrition.protein,
                            nutrition.carbohydrateFruitVegetable,
                            nutrition.carbohydrateNonFruitVegetable,
                            nutrition.fat),
                      ),
                      const Divider(),
                      const Text('پروتئین'),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayProtein1),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayProtein2),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayProtein3),
                      _buildLucineProteinSampleFood(context),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayProtein4),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayProtein5),
                    ],
                  ),
                )
                // const UserDescriptiveProfile(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLucineProteinSampleFood(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(context.l10n
                  .selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine1),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(context.l10n
                  .selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine2),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(context.l10n
                  .selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine3),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(context.l10n
                  .selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine4),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(context.l10n
                  .selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine5),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(context.l10n
                  .selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine6),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(context.l10n
                  .selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine7),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(context.l10n
                  .selectedFoodsListUserNutritionExerciseDayProtein3SampleLucine8),
            ),
          ],
        ),
      ],
    );
  }
}

class NutritionDescriptionExcerciseDayCarbohydrate extends StatelessWidget {
  const NutritionDescriptionExcerciseDayCarbohydrate({super.key});

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
            final nutrition = state.dietInfo
                .macroNutritionRequirements(state.dayActivityLevel);
            final proteinPerMeal = nutrition.protein ~/ (16 / 3);
            return ExpansionTile(
              title: const Text(
                'کربوهیدرات',
                // style: context.themeData.textTheme.bodyLarge,
              ),
              children: [
                MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.linear(1.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('قبل از تمرین'),
                      _buildText(
                        context.l10n
                            .selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate1(
                          state.dietInfo.weight.toInt(),
                          state.dietInfo.weight.toInt() * 2,
                          proteinPerMeal,
                        ),
                      ),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate2),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate3),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate4),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayBeforeExerciseCarbohydrate5),
                      const Divider(),
                      const Text('زمان تمرین'),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate1),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate2),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate3),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate4),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayDuringExerciseCarbohydrate5),
                      const Divider(),
                      const Text('بعد از تمرین'),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate1),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate2),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate4),
                      _buildText(
                        context.l10n
                            .selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate5(
                          state.dietInfo.weight.toInt(),
                          (state.dietInfo.weight * 1.2).toInt(),
                        ),
                      ),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate6),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate7),
                      _buildText(context.l10n
                          .selectedFoodsListUserNutritionExerciseDayAfterExerciseCarbohydrate8),
                    ],
                  ),
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

class NutritionDescriptionExcerciseDayHydration extends StatelessWidget {
  const NutritionDescriptionExcerciseDayHydration({super.key});

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
            return ExpansionTile(
              title: const Text(
                'آب رسانی',
                // style: context.themeData.textTheme.bodyLarge,
              ),
              children: [
                MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.linear(1.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(
                        context.l10n
                            .selectedFoodsListUserNutritionExerciseDayHydration1,
                      ),
                      _buildText(
                        context.l10n
                            .selectedFoodsListUserNutritionExerciseDayHydration2,
                      ),
                      _buildText(
                        context.l10n
                            .selectedFoodsListUserNutritionExerciseDayHydration3,
                      ),
                      _buildText(
                        context.l10n
                            .selectedFoodsListUserNutritionExerciseDayHydration4,
                      ),
                      _buildText(
                        context.l10n
                            .selectedFoodsListUserNutritionExerciseDayHydration5(
                                (state.dietInfo.weight * 5).toInt(),
                                (state.dietInfo.weight * 10).toInt()),
                      ),
                      _buildText(
                        context.l10n
                            .selectedFoodsListUserNutritionExerciseDayHydration6,
                      ),
                      _buildText(
                        context.l10n
                            .selectedFoodsListUserNutritionExerciseDayHydration7,
                      ),
                    ],
                  ),
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
