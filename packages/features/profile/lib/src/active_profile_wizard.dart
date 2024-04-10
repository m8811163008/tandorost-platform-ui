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
      isShowDrawerButton: true,
      bodyPadding: EdgeInsets.zero,
      title: Builder(builder: (context) {
        final currentPage = context.select<ProfileCubit, String>((cubit) =>
            'صفحه ${cubit.state.activePremiumWizardState.currentPage + 1} از 7 ');
        return Text(currentPage);
      }),
      child: PageView(
        onPageChanged: (value) {
          context.read<ProfileCubit>().updateCurrentPage(value);
          if (value == 6) {
            FocusScope.of(context).unfocus();
          }
        },
        scrollDirection: Axis.vertical,
        children: [
          const WizardPage1(),
          const WizardPage2(),
          const WizardPage3(),
          const WizardPage4(),
          const WizardPage5(),
          const WizardPage6(),
          WizardPageLast(
            key: UniqueKey(),
          ),
        ],
      ),
    );
  }
}
