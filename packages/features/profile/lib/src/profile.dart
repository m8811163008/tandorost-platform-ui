import 'package:authentication_repository/authentication_repository.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/cubit/profile_cubit.dart';
import 'package:user_repository/user_repository.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(
          RepositoryProvider.of<AuthenticationRepository>(context),
          RepositoryProvider.of<UserRepostiory>(context)),
      child: ProfilePageRedirector(),
    );
  }
}

class ProfilePageRedirector extends StatelessWidget {
  const ProfilePageRedirector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) =>
            previous.isShowWizard != current.isShowWizard,
        builder: (context, state) {
          return state.isShowWizard
              ? ActivePremiumWizardRoute()
              : ProfileView();
        });
  }
}

//  return ActivePremiumWizardRoute();
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      actions: [
        IconButton(
          tooltip: 'اضافه کردن اندازه گیری جدید',
          onPressed: () {},
          icon: Icon(Ionicons.add),
        ),
      ],
      child: ListView(
        children: [
          _buildProgreesCard(context),
          _buildProfileCard(context),
        ],
      ),
    );
  }

  Widget _buildProgreesCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Placeholder(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
