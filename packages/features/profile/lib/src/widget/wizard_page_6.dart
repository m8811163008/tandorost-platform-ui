import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            child: ShimmerTextNavigation(),
          ),
          _buildBodyCompositionMeasurementsInput(context),
        ],
      ),
    );
  }

  Widget _buildBodyCompositionMeasurementsInput(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildBodyCompositionInfoLabel(context),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            BodyCompositionMeasurementsInputs(),
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
              titlePadding: EdgeInsets.all(16.0),
              contentPadding:
                  EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              title: Text('شکل بدن'),
              children: [
                Text(
                  'اندازه گیری شکل بدن نسبت به اندازه گیری وزن بیشتر باعث انگیزه تناسب اندام میشود.',
                ),
                Text(
                  'با اندازه گیری شکل بدن متوجه میشوید توزیع کاهش چربی در بدن چه شکلی داشته',
                ),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                BodyCompositionImage(),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                Text(
                  'زمان اندازه گیری ماهیچه سرد باشد.',
                  style: context.themeData.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'حداکثر انقباض یا قطر ماهیچه را اندازه بگیرید.',
                ),
              ],
            );
          }),
        );
      },
      icon: Icon(Ionicons.information_circle_outline),
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
        TextField(
          autofocus: true,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          maxLength: 50,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            counterText: '',
          ),
          onChanged: context.read<ProfileCubit>().updateUsername,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        TextField(
          autofocus: true,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          maxLength: 50,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            counterText: '',
          ),
          onChanged: context.read<ProfileCubit>().updateUsername,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
