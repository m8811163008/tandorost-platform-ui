import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/add_new_measurement_bottom_sheet/measurement_bottom_sheet.dart';

import 'package:profile/src/profile_route/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        RepositoryProvider.of<UserRepostiory>(context),
        RepositoryProvider.of<FoodRepostiory>(context),
      ),
      child: const ProfilePageRedirector(),
    );
  }
}

class ProfilePageRedirector extends StatelessWidget {
  const ProfilePageRedirector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.profile != current.profile,
      builder: (context, state) {
        if (state.profile == ProfileCM.empty()) {
          return const AppScaffold(
            isShowDrawerButton: true,
            bodyPadding: EdgeInsets.zero,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return const ProfileView();
      },
    );
  }
}

//  return ActivePremiumWizardRoute();
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      bodyPadding: EdgeInsets.zero,
      actions: [
        _AddNewMeasurement(),
      ],
      child: ListView(
        children: [
          _buildProfileCard(context),
          _buildProgreesCard(context),
          _buildEnergyCard(context),
          _buildSummaryCard(context),
          _buildSettingCard(context),
        ],
      ),
    );
  }

  Widget _buildProgreesCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'روند پیشرفت',
                  style: context.themeData.textTheme.bodyLarge,
                ),
                _buildBodyCompositionInfoIcon(context),
              ],
            ),
            const AppLineChartBuilder(),
            const AppLineChartInputChips(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocSelector<ProfileCubit, ProfileState, ProfileCM>(
          selector: (state) {
            return state.profile;
          },
          builder: (context, profile) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'خوش آمدید ${profile.userName}',
                  style: context.themeData.textTheme.bodyLarge,
                ),
                if (profile.birthdayShamsi != null)
                  Text(
                    'تاریخ تولد: ${profile.birthdayShamsi!.split('/').reversed.join('/')}',
                  ),
                if (profile.birthday != null)
                  Text(
                    'سن شما: ${DateTime.now().difference(profile.birthday!).inDays ~/ 365}',
                  ),
                if (profile.bodyComposition.height.isNotEmpty)
                  Text(
                    'قد شما: ${profile.bodyComposition.height.first.value}',
                  ),
                Divider(
                  height: context.sizesExtenstion.medium,
                ),
                LoseWeightLabel(),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                LoseWeightSpeedSegmentedButtons(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildEnergyCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen: (prev, current) => prev.dietInfo != current.dietInfo,
          builder: (context, state) {
            final bmiDescription =
                context.l10n.appBmiStatus(state.dietInfo.bmiLevel.name);
            //BMI Prime, a modification of the BMI system, is the ratio of actual BMI to upper limit optimal BMI (currently defined at 25 kg/m2)
            final bmiPrime = state.dietInfo.bmi / 25;
            return ExpansionTile(
              title: Text(
                'وضعیت انرژی شما',
                style: context.themeData.textTheme.bodyLarge,
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodyShapeProgressConsidration(),
                    if (!state.bodyCompositionErrors.isEmpty) Divider(),
                    Text(
                      context.l10n.profileBmiDescription(
                        state.dietInfo.bmi,
                        bmiDescription,
                      ),
                    ),
                    Text(
                      context.l10n.profileWaistCircumferenceDescription(
                        state.dietInfo.waistCircumferenceToHeightRatio,
                      ),
                    ),
                    Text(
                      context
                          .l10n.profileBmiWaistCircumferenceHealthDescription,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Bmi Prime: ${bmiPrime.toStringAsFixed(2)}',
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    Divider(),
                    _buildSleepAndStressSection(context)
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSleepAndStressSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.profileEnergyDescriptionSleepAndStressTitle),
        Text(context.l10n.profileEnergyDescriptionSleepAndStressSubtitle1),
        Text(context.l10n.profileEnergyDescriptionSleepAndStressSubtitle2),
        Text(context.l10n.profileEnergyDescriptionSleepAndStressSubtitle3),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocSelector<ProfileCubit, ProfileState, ProfileCM>(
          selector: (state) {
            return state.profile;
          },
          builder: (context, state) {
            return ExpansionTile(
              title: Text(
                'خلاصه خوراک مورد نیاز',
                style: context.themeData.textTheme.bodyLarge,
              ),
              children: [
                const UserDescriptiveProfile(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHealthRiskDescriptionCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocSelector<ProfileCubit, ProfileState, ProfileCM>(
          selector: (state) {
            return state.profile;
          },
          builder: (context, state) {
            return ExpansionTile(
              title: Text(
                'خلاصه خوراک مورد نیاز',
                style: context.themeData.textTheme.bodyLarge,
              ),
              children: [
                Text('data'),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSettingCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocSelector<ProfileCubit, ProfileState, ProfileCM>(
          selector: (state) {
            return state.profile;
          },
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  'تنظیمات',
                  style: context.themeData.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: _ResetDialog(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBodyCompositionInfoIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: ((context) {
            return BodyCompositionDialog();
          }),
        );
      },
      icon: const Icon(Ionicons.information_circle_outline),
    );
  }
}

class LoseWeightLabel extends StatelessWidget {
  const LoseWeightLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'سرعت کاهش وزن',
          style: context.themeData.textTheme.bodyLarge,
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: ((context) {
                return LoseWeightSpeedDialog();
              }),
            );
          },
          icon: const Icon(Ionicons.information_circle_outline),
        ),
      ],
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.resettingStatus.isSuccess) {
          context.goNamed(Routes.splash);
        }
      },
      builder: (context, state) {
        return TextButton.icon(
          onPressed: !state.resettingStatus.isLoading
              ? context.read<ProfileCubit>().resetCollections
              : null,
          label: const Text('ریست داده ها'),
          icon: !state.resettingStatus.isLoading
              ? const SizedBox.shrink()
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}

class _AddNewMeasurement extends StatelessWidget {
  const _AddNewMeasurement({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'بروز رسانی اندازه گیری جدید',
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          enableDrag: false,
          showDragHandle: false,
          builder: (context) {
            return PopScope(
              canPop: false,
              child: BottomSheet(
                enableDrag: false,
                showDragHandle: false,
                builder: (context) {
                  return const MeasurementBottomSheet();
                },
                onClosing: () {},
              ),
            );
          },
        );
      },
      icon: const Icon(
        Ionicons.add,
      ),
    );
  }
}

class _ResetDialog extends StatelessWidget {
  const _ResetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          useRootNavigator: false,
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<ProfileCubit>(context),
            child: AlertDialog(
              title: const Text(
                  'آیا مطمئن هستید؟ نرم افزار به حالت اولیه نصب بازمیگردد.'),
              actions: [
                const ResetButton(),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('بازگشت'),
                )
              ],
            ),
          ),
        );
      },
      child: const Text('ریست حافظه'),
    );
  }
}

class LoseWeightSpeedSegmentedButtons extends StatelessWidget {
  const LoseWeightSpeedSegmentedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.changeWeightSpeedStatus != current.changeWeightSpeedStatus ||
          previous.profile.settingCM.changeWeightSpeed !=
              current.profile.settingCM.changeWeightSpeed,
      builder: (context, state) {
        final isLoading = state.changeWeightSpeedStatus.isLoading;
        return SegmentedButton<ChangeWeightSpeed>(
          segments: ChangeWeightSpeed.values.reversed
              .map((e) => ButtonSegment(
                  value: e,
                  label: Text(context.l10n
                      .profileChangeWeightSpeedButtonLabel(e.name))))
              .toList(),
          selected: {state.profile.settingCM.changeWeightSpeed},
          emptySelectionAllowed: true,
          showSelectedIcon: false,
          onSelectionChanged: !isLoading
              ? (Set<ChangeWeightSpeed> newSelection) {
                  context
                      .read<ProfileCubit>()
                      .updateChangeWeightSpeed(newSelection.first);
                }
              : null,
        );
      },
    );
  }
}

class BodyShapeProgressConsidration extends StatelessWidget {
  const BodyShapeProgressConsidration({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, Set<BodyCompositionError>>(
      selector: (state) => state.bodyCompositionErrors,
      builder: (context, bodyCompositionErrors) {
        return Column(
          children:
              bodyCompositionErrors.map((e) => buildErrorText(e)).toList(),
        );
      },
    );
  }

  Widget buildErrorText(bodyCompositionError) => switch (bodyCompositionError) {
        BodyCompositionError.weightChange => _ErrorText(
            text:
                'شما با نرخ بیشتر از 0.7% از وزنتون در هفته کاهش وزن داشتید، احتمال از دست دادن ماهیچه هست',
          ),
        BodyCompositionError.waistCircumfrenceIsGratherThan94or80 => _ErrorText(
            text:
                'دور کمر شما بیشتر از مقدار سالم(94 سانتی متر در آقایان و 80 سانتی متر در بانوان) است',
          ),
        BodyCompositionError
              .waistCircumfrenceToHeightRatioIsGreaterThanZeroPointFive =>
          _ErrorText(
            text:
                'اندازه دور کمر شما بیشتر از نصف قد شماست ، دور کمر شما زیاد است',
          ),
        _ => Text('ترجمه نشده است'),
      };
}

class UserDescriptiveProfile extends StatelessWidget {
  const UserDescriptiveProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, DietInfo>(
      selector: (state) => state.dietInfo,
      builder: (context, dietInfo) {
        // final changeWeightText = context.l10n
        //     .profileChangeWeightSpeedButtonLabel(
        //         dietInfo.changeWeightSpeed.name);
        final weeklyActivitylevel = context.l10n
            .profileActivityLevelButtonLabel(dietInfo.activityLevelCM.name);
        final macroNutritionRequirementsExerciseDay =
            dietInfo.macroNutritionRequirements(DayActivityLevel.moderate);
        final gramPerBodyWeightExerciseDay =
            macroNutritionRequirementsExerciseDay.protein / dietInfo.weight;
        final macroNutritionRequirementsRestDay =
            dietInfo.macroNutritionRequirements(DayActivityLevel.rest);
        // final gramPerBodyWeightRestDay =
        //     dietInfo.macroNutritionRequirements(DayActivityLevel.rest).protein /
        //         dietInfo.weight;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('پروتئین'),
            Text(
              context.l10n.profileUserDescriptionProtein1(
                weeklyActivitylevel,
              ),
            ),
            Text(
              context.l10n.profileUserDescriptionProtein2(
                macroNutritionRequirementsExerciseDay.protein,
                gramPerBodyWeightExerciseDay,
              ),
            ),
            Text(
              context.l10n.profileUserDescriptionProtein3(
                macroNutritionRequirementsRestDay.protein,
              ),
            ),
            Text(
              context.l10n.profileUserDescriptionProtein4,
            ),
            Divider(),
            _buildCarbohydrate(context, dietInfo),
            Divider(),
            Text('چربی'),
            Text(context.l10n.profileUserDescriptionFat1),
            Text(context.l10n.profileUserDescriptionFat2),
            Text(context.l10n.profileUserDescriptionFat3),
          ],
        );
      },
    );
  }

  Widget _buildCarbohydrate(BuildContext context, DietInfo dietInfo) {
    final carbohydrateValueInExerciseDayNonVegetable = dietInfo
        .macroNutritionRequirements(DayActivityLevel.moderate)
        .carbohydrateNonFruitVegetable;
    final carbohydrateValueInRestDayVegtables = dietInfo
        .macroNutritionRequirements(DayActivityLevel.rest)
        .carbohydrateFruitVegetable;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('کربوهیدرات'),
        Text(
          context.l10n.profileUserDescriptionCarbohydrate1,
        ),
        Text(
          context.l10n.profileUserDescriptionCarbohydrate2,
        ),
        Text(
          context.l10n.profileUserDescriptionCarbohydrate3(
              carbohydrateValueInExerciseDayNonVegetable),
        ),
        Text(
          context.l10n.profileUserDescriptionCarbohydrate4(
              carbohydrateValueInRestDayVegtables),
        ),
      ],
    );
  }
}

class _ErrorText extends StatelessWidget {
  const _ErrorText({super.key, this.text = ''});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(context.sizesExtenstion.small),
      color: context.themeData.colorScheme.secondaryContainer,
      child: Padding(
        padding: EdgeInsets.all(context.sizesExtenstion.medium),
        child: Text(
          text,
          style: context.themeData.textTheme.labelMedium!
              .copyWith(color: context.themeData.colorScheme.error),
          maxLines: 4,
        ),
      ),
    );
  }
}
