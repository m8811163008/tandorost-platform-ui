import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';

class WizardPageLast extends StatefulWidget {
  const WizardPageLast({super.key});

  @override
  State<WizardPageLast> createState() => _WizardPageLastState();
}

class _WizardPageLastState extends State<WizardPageLast> {
  @override
  void initState() {
    // TODO: implement check coffee bozzar account support
    // save the form
    context.read<ProfileCubit>().activePremiumWizardCreateProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
        listenWhen: (previous, current) =>
            previous.activePremiumWizardState.formSubmitStatus !=
            current.activePremiumWizardState.formSubmitStatus,
        listener: (context, state) {
          if (state.activePremiumWizardState.formSubmitStatus ==
              ProcessAsyncStatus.error) {
            context.showSnackbar(
              snackBar: SnackBar(
                duration: Duration(seconds: 10),
                content: Text('خطایی رخ داده است '),
                action: SnackBarAction(
                    label: 'خروج برنامه',
                    onPressed: () async {
                      await SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    }),
              ),
            );
          } else if (state.activePremiumWizardState.formSubmitStatus ==
              ProcessAsyncStatus.loaded) {
            context.showSnackbar(
              snackBar: SnackBar(
                content: Text('با موفقیت ذخیره شد '),
              ),
            );
            // Navigate to bazzar if is not active subscription
            // Navigate to profile
            context.pop();
          }
        },
        child: Center(
          child: ShimmerTextNavigation(
            isEnd: true,
            title: 'کافه بازار',
            isError: !context.select<ProfileCubit, bool>(
                (cubit) => cubit.state.isValidActivatePremiumForm),
          ),
        ));
  }
}
