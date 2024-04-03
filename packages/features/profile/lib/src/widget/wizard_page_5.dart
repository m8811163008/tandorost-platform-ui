import 'package:component_library/component_library.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/widget/widget.dart';

class WizardPage5 extends StatelessWidget {
  const WizardPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return WizardPageConstrained(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 0,
            bottom: 80,
            child: const ShimmerTextNavigation(),
          ),
          _buildActivityLevel(context),
        ],
      ),
    );
  }

  Widget _buildActivityLevel(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.l10n.profileActiviyLevel,
              style: context.themeData.textTheme.labelLarge,
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            const ActivityLevelButtons(),
          ],
        ),
      ),
    );
  }
}

class ActivityLevelButtons extends StatelessWidget {
  const ActivityLevelButtons({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1.3 / 3,
      height: height ?? 480,
      child: ActivityLevelsGrid(
        onSelected: context.read<ProfileCubit>().upsertActivityLevelChanging,
        initialValue: context
            .read<ProfileCubit>()
            .state
            .activePremiumWizardState
            .bodyCompositionValues
            .activityLevel,
      ),
    );
  }
}
