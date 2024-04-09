import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/widget/widget.dart';

class WizardPage3 extends StatelessWidget {
  const WizardPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return WizardPageConstrained(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildUserNameCard(context),
          _buildBirthdayCard(context),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Builder(builder: (context) {
              return ShimmerTextNavigation(
                isError: context.select<ProfileCubit, bool>(
                  (cubit) =>
                      cubit.state.activePremiumWizardState.createdProfileCM
                          .userName.isEmpty ||
                      cubit.state.activePremiumWizardState.createdProfileCM
                              .birthday ==
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

  Widget _buildUserNameCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.profileUsername,
              style: context.themeData.textTheme.labelLarge,
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildUsernameInput(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameInput(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Builder(builder: (context) {
        return TextFormField(
          autofocus: true,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          maxLength: 50,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            errorText: context.select<ProfileCubit, String?>(
              (cubit) => cubit.state.activePremiumWizardState.createdProfileCM
                      .userName.isEmpty
                  ? 'نام کاربری خالی است'
                  : null,
            ),
            counterText: '',
          ),
          initialValue: context
              .read<ProfileCubit>()
              .state
              .activePremiumWizardState
              .createdProfileCM
              .userName,
          onChanged: context.read<ProfileCubit>().updateUsername,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        );
      }),
    );
  }

  Widget _buildBirthdayCard(BuildContext context) {
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
                  context.l10n.profileBirthday,
                  style: context.themeData.textTheme.labelLarge,
                ),
                _buildBirthdayInfoIcon(context),
              ],
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            const _BirthdayContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildBirthdayInfoIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: ((context) {
            return SimpleDialog(
              titlePadding: const EdgeInsets.all(16.0),
              contentPadding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              title: const Text('تاریخ تولد'),
              children: [
                Text.rich(
                  TextSpan(
                      text:
                          'برای اندازه گیری انرژی مورد نیاز روزانه و ارسال پیام تبریک، تاریخ تولد یا به دنیا آمدن را وارد کنید',
                      children: [
                        TextSpan(
                            text: 'پشتیبانی فعلی از سن 17 تا 50 است',
                            style: context.themeData.textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                      ]),
                ),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                const Text(
                  'پیشنهاد اندازه خوراک به سن مرتبط است. نوجوان های زیر 17 سال و پیشکسوتان بالای 50 سال فعلا پشتیبانی نمیشود',
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

class _BirthdayContent extends StatelessWidget {
  const _BirthdayContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: _buildBirthdayLabel(context),
        ),
        _buildBirthdayInput(context),
      ],
    );
  }

  Widget _buildBirthdayInput(BuildContext context) {
    return ErrorIndicator(
      selector: (state) =>
          state.activePremiumWizardState.createdProfileCM.birthday == null,
      child: SelectBirthdayButton(
        initialDate: context
            .read<ProfileCubit>()
            .state
            .activePremiumWizardState
            .createdProfileCM
            .birthday,
        onSelectDate: context.read<ProfileCubit>().updateBirthDay,
      ),
    );
  }

  Widget _buildBirthdayLabel(BuildContext context) {
    return Builder(
      builder: (context) {
        final birthDay = context.select((ProfileCubit cubit) =>
            cubit.state.activePremiumWizardState.createdProfileCM.birthday);
        if (birthDay == null) {
          return SizedBox.shrink();
        }
        final years = DateTime.now().difference(birthDay).inDays ~/ 365;

        return FittedBox(
          child: Text(
            context.l10n.profileAgeText(
              years.toString(),
            ),
          ),
        );
      },
    );
  }
}
