import 'package:auth_repository/auth_repository.dart';
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/initialize_profile_wizard/cubit/initialize_user_cubit.dart';
import 'package:profile/src/widget/widget.dart';
import 'package:user_repository/user_repository.dart';

class ActivePremiumWizardRoute extends StatelessWidget {
  const ActivePremiumWizardRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitializeUserCubit(
        RepositoryProvider.of<UserRepostiory>(context),
        RepositoryProvider.of<AuthRepostiory>(context),
      ),
      child: const ActivePremiumWizardRouteView(),
    );
  }
}

class ActivePremiumWizardRouteView extends StatelessWidget {
  const ActivePremiumWizardRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      bodyPadding: EdgeInsets.zero,
      title: Builder(builder: (context) {
        final currentPage = context.select<InitializeUserCubit, String>(
            (cubit) => 'صفحه ${cubit.state.currentPage + 1} از 7 ');
        return Text(currentPage);
      }),
      child: PageView(
        onPageChanged: (value) {
          context.read<InitializeUserCubit>().updateCurrentPage(value);
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
