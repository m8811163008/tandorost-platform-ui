import 'dart:async';

import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/initialize_profile_wizard/cubit/initialize_user_cubit.dart';

class WizardPageLast extends StatelessWidget {
  const WizardPageLast({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InitializeUserCubit>();
    return MultiBlocListener(
        listeners: [
          BlocListener<InitializeUserCubit, InitializeUserState>(
            listenWhen: (previous, current) =>
                previous.formSubmitStatus != current.formSubmitStatus ||
                previous.userRules != current.userRules,
            listener: (context, state) async {
              if (state.formSubmitStatus == ProcessAsyncStatus.error) {
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
              } else if (state.formSubmitStatus == ProcessAsyncStatus.success) {
                context.showSnackbar(
                  snackBar: const SnackBar(
                    content: Text('با موفقیت ذخیره شد '),
                  ),
                );
                await Future.delayed(Duration(seconds: 2));
                if (!context.mounted) return;
                context.goNamed(Routes.profile);
              }
            },
          ),
          BlocListener<InitializeUserCubit, InitializeUserState>(
            listenWhen: (previous, current) =>
                previous.isValidActivatePremiumForm !=
                current.isValidActivatePremiumForm,
            listener: (context, state) {
              if (state.isValidActivatePremiumForm) {
                context
                    .read<InitializeUserCubit>()
                    .activePremiumWizardCreateProfile();
              }
            },
          ),
        ],
        child: Column(
          children: [
            _buildUserNameCard(context),
            _buildUserAgreementInput(context),
            Center(
              child: BlocBuilder<InitializeUserCubit, InitializeUserState>(
                builder: (context, state) {
                  return ShimmerTextNavigation(
                    isEnd: true,
                    //
                    title: state.userRules.contains(UserRule.dieter)
                        ? 'تکمیل'
                        : 'کافه بازار',
                    isError: !context.select<InitializeUserCubit, bool>(
                        (cubit) => cubit.state.isValidActivatePremiumForm),
                  );
                },
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
    return _UserNameField();
  }
}

class _UserNameField extends StatefulWidget {
  const _UserNameField({
    super.key,
  });

  @override
  State<_UserNameField> createState() => _UserNameFieldState();
}

class _UserNameFieldState extends State<_UserNameField> {
  final _controller = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitializeUserCubit, InitializeUserState>(
      listenWhen: (previous, current) =>
          previous.currentPage != current.currentPage,
      listener: (context, state) {
        if (_controller.hasFocus) {
          _controller.unfocus();
        }
      },
      child: SizedBox(
        height: 96,
        child: Builder(builder: (context) {
          return TextFormField(
            focusNode: _controller,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            maxLength: 50,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorText: context.select<InitializeUserCubit, String?>(
                (cubit) => cubit.state.createdProfileCM.userName.isEmpty
                    ? 'نام کاربری خالی است'
                    : null,
              ),
              counterText: '',
            ),
            initialValue: context
                .read<InitializeUserCubit>()
                .state
                .createdProfileCM
                .userName,
            onChanged: context.read<InitializeUserCubit>().updateUsername,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          );
        }),
      ),
    );
  }
}
