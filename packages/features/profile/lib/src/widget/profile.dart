import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

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
              return ShimmerTextNavigation(
                isEnd: true,
                isError: !context.select<InitializeUserCubit, bool>(
                    (cubit) => cubit.state.isValidActivatePremiumForm),
              );
            }),
          ),
          Column(
            children: [
              _buildBodyCompositionMeasurementsInput(context),
              _buildUserAgreementInput(context)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUserAgreementInput(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('شرایط استفاده'),
            ),
            const Text('از تندرست را قبول دارم.'),
            Builder(builder: (context) {
              return Checkbox(
                isError: !context
                    .read<InitializeUserCubit>()
                    .state
                    .isAgreementAccepted,
                value: context.select<InitializeUserCubit, bool>(
                    (cubit) => cubit.state.isAgreementAccepted),
                onChanged: (_) => context
                    .read<InitializeUserCubit>()
                    .toggleIsAgreementAccepted(),
              );
            })
          ],
        ),
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
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: ((context) {
            return SimpleDialog(
              titlePadding: const EdgeInsets.all(16.0),
              contentPadding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              title: const Text('شکل بدن'),
              children: [
                const Text(
                  'اندازه گیری شکل بدن نسبت به اندازه گیری وزن بیشتر باعث انگیزه تناسب اندام میشود.',
                ),
                const Text(
                  'با اندازه گیری شکل بدن متوجه میشوید توزیع کاهش چربی در بدن چه شکلی داشته',
                ),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                const BodyCompositionImage(),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                Text(
                  'زمان اندازه گیری ماهیچه سرد باشد.',
                  style: context.themeData.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'حداکثر انقباض یا قطر ماهیچه را اندازه بگیرید.',
                ),
              ],
            );
          }),
        );
      },
      icon: const Icon(Ionicons.information_circle_outline),
    );
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
          textInputAction: TextInputAction.done,
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
          textInputAction: TextInputAction.done,
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
          textInputAction: TextInputAction.done,
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
