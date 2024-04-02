import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/widget/widget.dart';

class ActivePremiumWizardRoute extends StatelessWidget {
  const ActivePremiumWizardRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bodyPadding: EdgeInsets.zero,
      title: Builder(builder: (context) {
        final currentPage = context.select<ProfileCubit, String>((cubit) =>
            'صفحه ${cubit.state.activePremiumWizardState.currentPage + 1} از 5 ');
        return Text(currentPage);
      }),
      child: PageView(
        onPageChanged: context.read<ProfileCubit>().updateCurrentPage,
        scrollDirection: Axis.vertical,
        children: [
          WizardPage1(),
          WizardPage2(),
          WizardPage3(),
        ],
      ),
    );
  }
}
