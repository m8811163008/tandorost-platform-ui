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
      actions: [
        _AddNewMeasurement(),
      ],
      child: ListView(
        children: [
          _buildProfileCard(context),
          _buildProgreesCard(context),
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
                LoseWeightSpeedSegmentedButtons()
              ],
            );
          },
        ),
      ),
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
                'وضعیت فعلی شما ',
                style: context.themeData.textTheme.bodyLarge,
              ),
              children: [
                Text(
                  'وضعیت فعلی 2 ',
                  style: context.themeData.textTheme.bodyLarge,
                ),
                Text(
                  'وضعیت فعلی 3 ',
                  style: context.themeData.textTheme.bodyLarge,
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
