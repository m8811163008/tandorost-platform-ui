import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/widget/widget.dart';

class WizardPage2 extends StatelessWidget {
  const WizardPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return WizardPageConstrained(
      child: Column(
        children: [
          _buildWeightCard(context),
          _buildGenderCard(context),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Builder(builder: (context) {
              return ShimmerTextNavigation(
                isError: context.select<ProfileCubit, bool>(
                  (cubit) =>
                      cubit.state.activePremiumWizardState.createdProfileCM
                          .isMale ==
                      null,
                ),
              );
            }),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }

  Widget _buildWeightCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeightLabel(context),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildWeightScrollNumberInput(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightLabel(BuildContext context) {
    return Builder(builder: (context) {
      final value = context.select<ProfileCubit, int>((cubit) =>
          cubit.state.activePremiumWizardState.bodyCompositionValues.weight ??
          0);
      return Text(
        '${context.l10n.profileWeight} $value ${context.l10n.profileKiloGrams}',
        style: context.themeData.textTheme.labelLarge,
      );
    });
  }

  Widget _buildWeightScrollNumberInput(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ScrollableNumberInput(
        intialValue: context
            .read<ProfileCubit>()
            .state
            .activePremiumWizardState
            .bodyCompositionValues
            .weight,
        axis: Axis.horizontal,
        onSelectedNumberChanged: context.read<ProfileCubit>().upsertWeight,
        min: 40,
        max: 170,
      ),
    );
  }

  Widget _buildGenderCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.profileGender,
              style: context.themeData.textTheme.labelLarge,
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildGenderSegmentedInput(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSegmentedInput(BuildContext context) {
    final intialValue = context.select<ProfileCubit, bool?>((cubit) =>
        cubit.state.activePremiumWizardState.createdProfileCM.isMale);
    return ErrorIndicator(
      selector: (state) =>
          state.activePremiumWizardState.createdProfileCM.isMale == null,
      child: SegmentedButton<bool>(
        segments: const <ButtonSegment<bool>>[
          ButtonSegment<bool>(
            value: true,
            label: Text('مرد'),
          ),
          ButtonSegment<bool>(
            value: false,
            label: Text('زن'),
          ),
        ],
        selected: {if (intialValue != null) intialValue},
        emptySelectionAllowed: true,
        onSelectionChanged: (Set<bool> newSelection) {
          context
              .read<ProfileCubit>()
              .updateIsMale(newSelection.contains(true));
        },
      ),
    );
  }
}
