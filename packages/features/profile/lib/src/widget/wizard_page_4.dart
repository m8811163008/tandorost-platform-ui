import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/widget/widget.dart';

class WizardPage4 extends StatelessWidget {
  const WizardPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return WizardPageConstrained(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSetTargetCard(context),
          const Spacer(),
          const Align(
            alignment: Alignment.bottomRight,
            child: ShimmerTextNavigation(),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }

  Widget _buildSetTargetCard(BuildContext context) {
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
                  context.l10n.profileTarget,
                  style: context.themeData.textTheme.labelLarge,
                ),
                _buildSetTargetInfoIcon(context),
              ],
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildSetTargetScrollNumberInput(context)
          ],
        ),
      ),
    );
  }

  Widget _buildSetTargetScrollNumberInput(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ScrollableNumberInput(
        // TODO reserve state
        axis: Axis.horizontal,
        onSelectedNumberChanged: (days) {
          final targetDate =
              DateTime.now().add(Duration(days: days, minutes: 10));
          context
              .read<ProfileCubit>()
              .upsertStartBodycompositionChanging(targetDate);
        },
        intialValue: context
            .read<ProfileCubit>()
            .state
            .activePremiumWizardState
            .bodyCompositionValues
            .startBodycompositionChanging
            ?.difference(DateTime.now())
            .inDays,
        min: 0,
        max: 15,
      ),
    );
  }

  Widget _buildSetTargetInfoIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: ((context) {
            return SimpleDialog(
              titlePadding: const EdgeInsets.all(16.0),
              contentPadding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              title: const Text('انتخاب هدف و تاریخ شروع'),
              children: [
                Text.rich(
                  TextSpan(text: '''
قبل از شروع برنامه تناسب اندام، اهداف خود را یادداشت کنید. تحقیقات ثابت کرده است که با نوشتن اهداف خود، به احتمال زیاد آنها را به عمل تبدیل می کنید. 

''', children: [
                    TextSpan(
                        text:
                            'نوشتن تاریخ شروع باعث میشه برای رسیدن به هدف تناسب اندام آماده باشید',
                        style: context.themeData.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ]),
                ),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                const Text('''
این اهداف باید مشخص، مثبت و واقع بینانه باشند مانند ("من 5 کیلوگرم چربی بدن را از دست خواهم داد") به جای اینکه امیدوارانه و نامشخص باشند مانند ("من می خواهم کمی وزن کم کنم")
'''),
              ],
            );
          }),
        );
      },
      icon: const Icon(Ionicons.information_circle_outline),
    );
  }
}
