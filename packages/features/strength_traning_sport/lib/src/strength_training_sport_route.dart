import 'package:auth_repository/auth_repository.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strength_traning_sport/src/cubit/strength_traning_cubit.dart';

import 'package:url_launcher/url_launcher.dart';

class StrengthTrainingRoute extends StatelessWidget {
  const StrengthTrainingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StrengthTraningCubit(
          authRepostiory: RepositoryProvider.of<AuthRepostiory>(context)),
      child: StrengthTrainingView(),
    );
  }
}

class StrengthTrainingView extends StatelessWidget {
  const StrengthTrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      child: ListView(
        children: StrengthTraningProgram.strengthTrainingPrograms
            .map((e) => SportProgramTile(
                  imageNumber: StrengthTraningProgram.strengthTrainingPrograms
                          .indexOf(e) +
                      1,
                  label: e.label,
                  resourceUrl: e.resourceUrl,
                ))
            .toList(),
      ),
    );
  }
}

class SportProgramTile extends StatelessWidget {
  const SportProgramTile(
      {super.key,
      required this.imageNumber,
      required this.label,
      required this.resourceUrl});
  final String resourceUrl;
  final int imageNumber;
  final String label;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StrengthTraningCubit>();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.6],
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16.0),
              child: SportProgramImage(
                imageNumber: imageNumber,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                UserRoleVisibility(
                  userRoleStream: RepositoryProvider.of<AuthRepostiory>(context)
                      .currentUserRulesStream(),
                  dieterWidget: ElevatedButton(
                    onPressed: () async {
                      final url = Uri.tryParse(resourceUrl);
                      if (url == null) return;
                      try {
                        await launchUrl(url);
                      } catch (_, __) {}
                    },
                    child: Text(
                      'دانلود',
                    ),
                  ),
                  foodTrackerWidget: ElevatedButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        isScrollControlled: true,
                        // useRootNavigator: true,
                        builder: (context) {
                          return FractionallySizedBox(
                            heightFactor: 0.8,
                            child: BlocProvider.value(
                              value: cubit,
                              child: Builder(builder: (context) {
                                return BlocConsumer<StrengthTraningCubit,
                                    StrengthTraningState>(
                                  listenWhen: (previous, current) =>
                                      previous.puchaseSubscriptionStatus !=
                                      current.puchaseSubscriptionStatus,
                                  listener: (context, state) {
                                    if (state.puchaseSubscriptionStatus
                                            .isSuccess ||
                                        state.puchaseSubscriptionStatus
                                            .isError) {
                                      context.pop();
                                      context.goNamed(Routes.splash);
                                    }
                                  },
                                  builder: (context, state) {
                                    return SubscribeBottomSheet(
                                      onSelected: context
                                          .read<StrengthTraningCubit>()
                                          .subscribe,
                                    );
                                  },
                                );
                              }),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'دانلود',
                    ),
                  ),
                  //   foodTrackerWidget: TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'مسافت طی شده به متر',
                  //     hintText: 'مسافت طی شده در ۱۲ دقیقه به متر',
                  //   ),
                  //   readOnly: true,
                  // onTap: () async {

                  // },
                  //   keyboardType: TextInputType.numberWithOptions(decimal: true),
                  //   textInputAction: TextInputAction.done,
                  // ),,
                ),
                SizedBox(
                  width: context.sizesExtenstion.medium,
                ),
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.left,
                    style: context.themeData.textTheme.headlineSmall!.copyWith(
                      color: context.themeData.colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
