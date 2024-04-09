import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';

class WizardPageLast extends StatelessWidget {
  const WizardPageLast({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<ProfileCubit, ProfileState>(
            listenWhen: (previous, current) =>
                previous.activePremiumWizardState.formSubmitStatus !=
                current.activePremiumWizardState.formSubmitStatus,
            listener: (context, state) {
              if (state.activePremiumWizardState.formSubmitStatus ==
                  ProcessAsyncStatus.error) {
                context.showSnackbar(
                  snackBar: SnackBar(
                    duration: const Duration(seconds: 10),
                    content: const Text('خطایی رخ داده است '),
                    action: SnackBarAction(
                        label: 'خروج برنامه',
                        onPressed: () async {
                          await SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        }),
                  ),
                );
              } else if (state.activePremiumWizardState.formSubmitStatus ==
                  ProcessAsyncStatus.success) {
                context.showSnackbar(
                  snackBar: const SnackBar(
                    content: Text('با موفقیت ذخیره شد '),
                  ),
                );
                // Navigate to bazzar if is not active subscription
                // Navigate to profile
                context.goNamed(Routes.profile);
              }
            },
          ),
          BlocListener<ProfileCubit, ProfileState>(
            listenWhen: (previous, current) =>
                previous.isValidActivatePremiumForm !=
                current.isValidActivatePremiumForm,
            listener: (context, state) {
              if (state.isValidActivatePremiumForm) {
                context.read<ProfileCubit>().activePremiumWizardCreateProfile();
              }
            },
          )
        ],
        child: Column(
          children: [
            _buildUserAgreementInput(context),
            Center(
              child: ShimmerTextNavigation(
                isEnd: true,
                title: 'کافه بازار',
                isError: !context.select<ProfileCubit, bool>(
                    (cubit) => cubit.state.isValidActivatePremiumForm),
              ),
            ),
          ],
        ));
  }

  Widget _buildUserAgreementInput(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                showAgreementDialog(context);
              },
              child: const Text('شرایط استفاده'),
            ),
            const Text('از تندرست را قبول دارم.'),
            Builder(builder: (context) {
              return Checkbox(
                isError: !context
                    .read<ProfileCubit>()
                    .state
                    .activePremiumWizardState
                    .isAgreementAccepted,
                value: context.select<ProfileCubit, bool>((cubit) =>
                    cubit.state.activePremiumWizardState.isAgreementAccepted),
                onChanged: (_) =>
                    context.read<ProfileCubit>().toggleIsAgreementAccepted(),
              );
            })
          ],
        ),
      ),
    );
  }

  void showAgreementDialog(BuildContext context) {
    const userAgrrement = '''
    تندرست به شما بر اساس جدید ترین تحقیقات علم تغذیه و ورزش برای تناسب اندام به شما پیشنهاد‌هایی برای ترکیب بدنی سالم ارائه میکند.

    قبل از استفاده از محصولات تندرست با پزشک خود مشورت کنید.

    برای افراد زیر 17 سال و بالای 50 سال پشتیبانی نمیشود.
    ''';
    showDialog(
      context: context,
      builder: ((context) {
        return Dialog.fullscreen(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'شرایط استفاده',
              ),
            ),
            body: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                userAgrrement,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        );
      }),
    );
  }
}
