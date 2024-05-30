import 'package:auth_repository/auth_repository.dart';
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
        RepositoryProvider.of<AuthRepostiory>(context),
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
        if (state.profile == const ProfileCM.empty()) {
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
      actions: const [
        _AddNewMeasurement(),
      ],
      child: ListView(
        children: [
          _buildProfileCard(context),
          EnergyCard(),
          _buildProgreesCard(context),
          SummaryCard(),
          FastingCard(),
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
      margin: const EdgeInsets.all(16.0),
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
                const LoseWeightLabel(),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                UserRoleVisibility(
                  userRoleStream: RepositoryProvider.of<AuthRepostiory>(context)
                      .currentUserRulesStream(),
                  dieterWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoseWeightSpeedSegmentedButtons(),
                      SizedBox(
                        height: context.sizesExtenstion.medium,
                      ),
                      ExpireDateRemainingWidget(),
                    ],
                  ),
                  foodTrackerWidget: LoseWeightSpeedSegmentedButtonsPromotion(),
                ),
                Divider(
                  height: context.sizesExtenstion.large,
                ),
                Text(
                  'فستینگ و رژیم روزه داری',
                  style: context.themeData.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                UserRoleVisibility(
                  userRoleStream: RepositoryProvider.of<AuthRepostiory>(context)
                      .currentUserRulesStream(),
                  dieterWidget: FastingSegmentedButtons(),
                  foodTrackerWidget: FastingSegmentedButtonsPromotion(),
                  // foodTrackerWidget: FastingSegmentedButtons(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSettingCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
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
                const Align(
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
            return const BodyCompositionDialog();
          }),
        );
      },
      icon: const Icon(Ionicons.information_circle_outline),
    );
  }
}

class ExpireDateRemainingWidget extends StatelessWidget {
  const ExpireDateRemainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, int>(
      selector: (state) => state.remainingDays,
      builder: (context, remainingDays) {
        return Text(
          'تعداد روز باقی مانده از اشتراک : $remainingDays',
          style: context.themeData.textTheme.labelSmall,
        );
      },
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
                return const LoseWeightSpeedDialog();
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
  const _AddNewMeasurement();

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
  const _ResetDialog();

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
  const LoseWeightSpeedSegmentedButtons({
    super.key,
  });

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

class FastingSegmentedButtons extends StatelessWidget {
  const FastingSegmentedButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.profile.settingCM.isFasting !=
          current.profile.settingCM.isFasting,
      builder: (context, state) {
        return SegmentedButton<bool>(
          segments: [true, false]
              .map((e) =>
                  ButtonSegment(value: e, label: Text(e ? 'روشن' : 'خاموش')))
              .toList(),
          selected: {state.profile.settingCM.isFasting},
          emptySelectionAllowed: true,
          showSelectedIcon: false,
          onSelectionChanged: (Set<bool> newSelection) {
            context.read<ProfileCubit>().updateIsFasting(newSelection.first);
          },
        );
      },
    );
  }
}

class LoseWeightSpeedSegmentedButtonsPromotion extends StatelessWidget {
  const LoseWeightSpeedSegmentedButtonsPromotion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return SegmentedButton<ChangeWeightSpeed>(
      segments: ChangeWeightSpeed.values.reversed
          .map((e) => ButtonSegment(
              value: e,
              label: Text(
                  context.l10n.profileChangeWeightSpeedButtonLabel(e.name))))
          .toList(),
      selected: const {ChangeWeightSpeed.none},
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      onSelectionChanged: (_) async {
        await showModalBottomSheet(
          context: context,
          isDismissible: true,
          isScrollControlled: true,
          // useRootNavigator: true,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.8,
              child: BlocProvider.value(
                value: cubit,
                child: Builder(builder: (context) {
                  return BlocConsumer<ProfileCubit, ProfileState>(
                    listenWhen: (previous, current) =>
                        previous.puchaseSubscriptionStatus !=
                        current.puchaseSubscriptionStatus,
                    listener: (context, state) {
                      if (state.puchaseSubscriptionStatus.isSuccess ||
                          state.puchaseSubscriptionStatus.isError) {
                        context.pop();
                        context.goNamed(Routes.splash);
                      }
                    },
                    builder: (context, state) {
                      return SubscribeBottomSheet(
                        onSelected: context.read<ProfileCubit>().subscribe,
                      );
                    },
                  );
                }),
              ),
            );
          },
        );
      },
    );
  }
}

class FastingSegmentedButtonsPromotion extends StatelessWidget {
  const FastingSegmentedButtonsPromotion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return SegmentedButton<bool>(
      segments: [true, false]
          .map(
              (e) => ButtonSegment(value: e, label: Text(e ? 'روشن' : 'خاموش')))
          .toList(),
      selected: {false},
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      onSelectionChanged: (_) async {
        await showModalBottomSheet(
          context: context,
          isDismissible: true,
          isScrollControlled: true,
          // useRootNavigator: true,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.8,
              child: BlocProvider.value(
                value: cubit,
                child: Builder(builder: (context) {
                  return BlocConsumer<ProfileCubit, ProfileState>(
                    listenWhen: (previous, current) =>
                        previous.puchaseSubscriptionStatus !=
                        current.puchaseSubscriptionStatus,
                    listener: (context, state) {
                      if (state.puchaseSubscriptionStatus.isSuccess ||
                          state.puchaseSubscriptionStatus.isError) {
                        context.pop();
                        context.goNamed(Routes.splash);
                      }
                    },
                    builder: (context, state) {
                      return SubscribeBottomSheet(
                        onSelected: context.read<ProfileCubit>().subscribe,
                      );
                    },
                  );
                }),
              ),
            );
          },
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
        BodyCompositionError.weightChange => const _ErrorText(
            text:
                'شما با نرخ بیشتر از 0.7% از وزنتون در هفته کاهش وزن داشتید، احتمال از دست دادن ماهیچه هست. بیشتر پروتیین بخورید و ورزش مقاوتی انجام دهید',
          ),
        BodyCompositionError.waistCircumfrenceIsGratherThan94or80 =>
          const _ErrorText(
            text:
                'دور کمر شما بیشتر از مقدار سالم(94 سانتی متر در آقایان و 80 سانتی متر در بانوان) است و چربی اضافی دارید و ریسک ابتلا به دیابت نوع ۲ برای شما بالاست. دور کمر خود را سریع لاغر کنید',
          ),
        BodyCompositionError
              .waistCircumfrenceToHeightRatioIsGreaterThanZeroPointFive =>
          const _ErrorText(
            text:
                'اندازه دور کمر شما بیشتر از نصف قد شماست ، دور کمر شما زیاد است و خطرات مرتبط با سلامتی برای شما بالاست. دور کمر خود را سریع لاغر کنید',
          ),
        _ => const Text('ترجمه نشده است'),
      };
}

class UserDescriptiveProfile extends StatelessWidget {
  const UserDescriptiveProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.5)),
      child: BlocSelector<ProfileCubit, ProfileState, DietInfo>(
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
              const Text('پروتئین'),
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
              const Divider(),
              _buildCarbohydrate(context, dietInfo),
              const Divider(),
              const Text('چربی'),
              Text(context.l10n.profileUserDescriptionFat1),
              Text(context.l10n.profileUserDescriptionFat2),
              Text(context.l10n.profileUserDescriptionFat3),
            ],
          );
        },
      ),
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
        const Text('کربوهیدرات'),
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
  const _ErrorText({this.text = ''});
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

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return UserRoleVisibility(
      userRoleStream: RepositoryProvider.of<AuthRepostiory>(context)
          .currentUserRulesStream(),
      dieterWidget: _buildSummaryCard(context),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
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
              children: const [
                UserDescriptiveProfile(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FastingCard extends StatelessWidget {
  const FastingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return UserRoleVisibility(
      userRoleStream: RepositoryProvider.of<AuthRepostiory>(context)
          .currentUserRulesStream(),
      dieterWidget: _buildFastingCard(context),
      
    );
  }

  Widget _buildFastingCard(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, ProfileCM>(
      selector: (state) {
        return state.profile;
      },
      builder: (context, profile) {
        if(!profile.settingCM.isFasting) return SizedBox.shrink();
        return Card(
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ExpansionTile(
              title: Text(
                'فستینگ و رژیم روزه داری',
                style: context.themeData.textTheme.bodyLarge,
              ),
              children:  [
                Text('فستینگ یا غذا خوردن با محدودیت زمانی شکلی از روزه داری متناوب است که شامل یک دوره روزه داری 12 تا 16 ساعت و یک دوره غذا خوردن 8 تا 12 ساعت در روز است', style: context.themeData.textTheme.bodyLarge,),
                Text('تنظیم غذا خوردن با ریتم شبانه روزی (ساعت درونی بدن) به بدن شما کمک می کند که کارآمدتر کار کند و در نتیجه باعث بهبود سلامت و کاهش وزن می شود', style: context.themeData.textTheme.bodyLarge),
                Text('مطالعات نشان می دهد که اختلال در ریتم شبانه روزی تأثیر منفی بر هورمون هایی دارد که اشتها، مصرف انرژی و گلوکز خون را کنترل می کنند', style: context.themeData.textTheme.bodyLarge),
                SizedBox(height: context.sizesExtenstion.medium,),
                Text('خوردن از ساعت 8 صبح تا 2 ظهر میتواند مفید باشد زیرا اشتها و متعاقب آن مصرف غذا را کاهش می دهد', style: context.themeData.textTheme.bodyLarge),
                Text(' یک مطالعه نشان داد غذا خوردن در یک پنجره 6 ساعته قبل از ساعت 3 بعد از ظهر باعث کاهش گرسنگی و کاهش عوامل خطر دیابت نوع 2 در مردان مبتلا به پیش دیابت بوده است', style: context.themeData.textTheme.bodyLarge),
                Text(' در فستینگ چون زمان کمتری برای خوردن است در نتیجه امکان دارد انرژی و کالری کمتری دریافت کنید که باعث کاهش وزن میشود. همچنین انطباق با ساعت زیستی بدن باعث میشود از دیرخوردن شام جلوگیری کنید', style: context.themeData.textTheme.bodyLarge),
                SizedBox(height: context.sizesExtenstion.medium,),
                Text('بیشتر مطالعات فستینگ تا به امروز روی مگس میوه و موش انجام شده است . شواهد رژیم فستینگ روی انسان محدود است و تا به امروز، تنها تعداد کمی از مطالعات نتایج مثبتی را برای کاهش وزن نشان داده‌اند.', style: context.themeData.textTheme.bodyLarge),
                SizedBox(height: context.sizesExtenstion.medium,),
                Text('در دوره غذا خوردن مطابق انرژی مورد نیاز و درشت مغذی های مورد نیاز خود در تب تحلیل خوراکی های ثبت شده رژیم بگیرید', style: context.themeData.textTheme.bodyLarge),
                Text('فستینگ های معمول شامل 12 ساعت روزه داری و 12 ساعت غذاخوردن میباشد و شما میتوانید تا 16 ساعت روزه خود را بیشتر نگه دارید', style: context.themeData.textTheme.bodyLarge),
                Text('نوشیدن مایعات مانند آب و دمنوش در تمام طول شبانه روز مجاز است', style: context.themeData.textTheme.bodyLarge),
                // UserDescriptiveProfile(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EnergyCard extends StatelessWidget {
  const EnergyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildEnergyCard(context);
  }

  Widget _buildEnergyCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
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
                MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.linear(1.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BodyShapeProgressConsidration(),
                      // if (state.bodyCompositionErrors.isNotEmpty)
                      //   const Divider(),
                      SizedBox(
                        height: context.sizesExtenstion.medium,
                      ),
                      Text(
                        context.l10n.profileBmiDescription(
                          state.dietInfo.bmi,
                          bmiDescription,
                        ),
                      ),
                      SizedBox(
                        height: context.sizesExtenstion.small,
                      ),
                      Text(
                        context.l10n.profileWaistCircumferenceDescription(
                          state.dietInfo.waistCircumferenceToHeightRatio,
                        ),
                      ),
                      SizedBox(
                        height: context.sizesExtenstion.small,
                      ),
                      Text(
                        context
                            .l10n.profileBmiWaistCircumferenceHealthDescription,
                      ),
                      SizedBox(
                        height: context.sizesExtenstion.medium,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Bmi Prime: ${bmiPrime.toStringAsFixed(2)}',
                          textDirection: TextDirection.ltr,
                          style: context.themeData.textTheme.bodySmall,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Normal Bmi Prime range : 0.74 – 0.99',
                          textDirection: TextDirection.ltr,
                          style: context.themeData.textTheme.bodySmall,
                        ),
                      ),
                      UserRoleVisibility(
                        userRoleStream:
                            RepositoryProvider.of<AuthRepostiory>(context)
                                .currentUserRulesStream(),
                        dieterWidget: Column(
                          children: [
                            const Divider(),
                            _buildSleepAndStressSection(context)
                          ],
                        ),
                      ),
                    ],
                  ),
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
}
