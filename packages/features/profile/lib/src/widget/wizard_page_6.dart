import 'package:component_library/component_library.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/widget/widget.dart';

class WizardPage6 extends StatelessWidget {
  const WizardPage6({super.key});

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
            child: Builder(builder: (context) {
              return ShimmerTextNavigation();
            }),
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                _buildBodyCompositionMeasurementsInput(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBodyCompositionMeasurementsInput(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ExpansionTile(
          title: _buildBodyCompositionInfoLabel(context),
          controlAffinity: ListTileControlAffinity.leading,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: context.sizesExtenstion.small),
              child: const BodyCompositionMeasurementsInputs(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyCompositionInfoLabel(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${context.l10n.profileBodyShape} (${context.l10n.mandetory})',
          style: context.themeData.textTheme.labelLarge,
        ),
        _buildBodyCompositionInfoIcon(context),
      ],
    );
  }

  Widget _buildBodyCompositionInfoIcon(BuildContext context) {
    return BodycompositionInfoIcon();
  }
}

class BodyCompositionMeasurementsInputs extends StatelessWidget {
  const BodyCompositionMeasurementsInputs({super.key, this.height = 500});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.done,
          maxLength: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              labelText: 'دور باسن'),
          initialValue: context
              .read<ProfileCubit>()
              .state
              .activePremiumWizardState
              .bodyCompositionValues
              .hipCircumference,
          onChanged: context.read<ProfileCubit>().upsertHipCircumference,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.done,
          maxLength: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              labelText: 'دور ران'),
          initialValue: context
              .read<ProfileCubit>()
              .state
              .activePremiumWizardState
              .bodyCompositionValues
              .thightCircumference,
          onChanged: context.read<ProfileCubit>().upsertThightCircumference,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.done,
          maxLength: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              labelText: 'دور سینه'),
          initialValue: context
              .read<ProfileCubit>()
              .state
              .activePremiumWizardState
              .bodyCompositionValues
              .chestCircumference,
          onChanged: context.read<ProfileCubit>().upsertChestCircumference,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.done,
          maxLength: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              labelText: 'دور بازو'),
          initialValue: context
              .read<ProfileCubit>()
              .state
              .activePremiumWizardState
              .bodyCompositionValues
              .armCircumference,
          onChanged: context.read<ProfileCubit>().upsertArmCircumference,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.done,
          maxLength: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              labelText: 'دور ماهیچه ساق پا',
              hintText: 'حداکثر اندازه ماهیچه ساق پا'),
          initialValue: context
              .read<ProfileCubit>()
              .state
              .activePremiumWizardState
              .bodyCompositionValues
              .calfMuscleCircumference,
          onChanged: context.read<ProfileCubit>().upsertCalfMuscleCircumference,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
