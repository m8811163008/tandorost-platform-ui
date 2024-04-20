import 'package:component_library/component_library.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/initialize_profile_wizard/cubit/initialize_user_cubit.dart';
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
              return const ShimmerTextNavigation();
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
        child: Column(
          children: [
            _buildBodyCompositionInfoLabel(context),
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
    return const BodycompositionInfoIcon();
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
          textInputAction: TextInputAction.next,
          maxLength: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              labelText: 'دور باسن'),
          initialValue: context
              .read<InitializeUserCubit>()
              .state
              .bodyCompositionValues
              .hipCircumference,
          onChanged: context.read<InitializeUserCubit>().upsertHipCircumference,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.next,
          maxLength: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              labelText: 'دور ران'),
          initialValue: context
              .read<InitializeUserCubit>()
              .state
              .bodyCompositionValues
              .thightCircumference,
          onChanged:
              context.read<InitializeUserCubit>().upsertThightCircumference,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.next,
          maxLength: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              labelText: 'دور سینه'),
          initialValue: context
              .read<InitializeUserCubit>()
              .state
              .bodyCompositionValues
              .chestCircumference,
          onChanged:
              context.read<InitializeUserCubit>().upsertChestCircumference,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.next,
          maxLength: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              labelText: 'دور بازو'),
          initialValue: context
              .read<InitializeUserCubit>()
              .state
              .bodyCompositionValues
              .armCircumference,
          onChanged: context.read<InitializeUserCubit>().upsertArmCircumference,
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
              .read<InitializeUserCubit>()
              .state
              .bodyCompositionValues
              .calfMuscleCircumference,
          onChanged:
              context.read<InitializeUserCubit>().upsertCalfMuscleCircumference,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
