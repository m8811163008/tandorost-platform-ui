import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/initialize_profile_wizard/cubit/initialize_user_cubit.dart';
import 'package:profile/src/widget/widget.dart';

class WizardPage1 extends StatelessWidget {
  const WizardPage1({super.key});

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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'برای دسترسی به نمایه کاربری فرم زیر را کامل کنید.',
                    style: context.themeData.textTheme.labelMedium,
                  ),
                ),
              ),
              _buildHeightCard(context),
              _buildWaistCircumferenceCard(context),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHeightCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeightLabel(context),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildHeightScrollNumberInput(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeightLabel(BuildContext context) {
    return Builder(builder: (context) {
      final value = context.select<InitializeUserCubit, int>(
          (cubit) => cubit.state.bodyCompositionValues.height ?? 0);
      return Text(
        '${context.l10n.profileHeight} $value ${context.l10n.profileCentiMetre}',
        style: context.themeData.textTheme.labelLarge,
      );
    });
  }

  Widget _buildHeightScrollNumberInput(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ScrollableNumberInput(
        intialValue: context
            .read<InitializeUserCubit>()
            .state
            .bodyCompositionValues
            .height,
        axis: Axis.horizontal,
        onSelectedNumberChanged:
            context.read<InitializeUserCubit>().upsertHeight,
        min: 138,
        max: 222,
      ),
    );
  }

  Widget _buildWaistCircumferenceCard(BuildContext context) {
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
                _buildWaistCircumferenceLabel(context),
                _buildWaistCircumferenceInfoIcon(context),
              ],
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildWaistCircumferenceScrollNumberInput(context)
          ],
        ),
      ),
    );
  }

  Widget _buildWaistCircumferenceLabel(BuildContext context) {
    return Builder(builder: (context) {
      final value = context.select<InitializeUserCubit, int>(
          (cubit) => cubit.state.bodyCompositionValues.waistCircumference ?? 0);
      return Text(
        '${context.l10n.profileWaistCircumference} $value ${context.l10n.profileCentiMetre}',
        style: context.themeData.textTheme.labelLarge,
      );
    });
  }

  Widget _buildWaistCircumferenceScrollNumberInput(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ScrollableNumberInput(
        intialValue: context
            .read<InitializeUserCubit>()
            .state
            .bodyCompositionValues
            .waistCircumference,
        axis: Axis.horizontal,
        onSelectedNumberChanged:
            context.read<InitializeUserCubit>().upsertWaistCircumference,
        min: 68,
        max: 111,
      ),
    );
  }

  Widget _buildWaistCircumferenceInfoIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: ((context) {
            return const WaistCircumferenceSimpleDoialog();
          }),
        );
      },
      icon: const Icon(Ionicons.information_circle_outline),
    );
  }
}
