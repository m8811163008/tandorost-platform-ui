import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/profile_route/model/chart_type.dart';
import 'package:profile/src/profile_route/widgets/widgets.dart';

class AppLineChartBuilder extends StatelessWidget {
  const AppLineChartBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.chartType != current.chartType ||
          previous.profile.bodyComposition != current.profile.bodyComposition,
      builder: (context, state) {
        if (state.chartData.isEmpty) {
          return SizedBox.shrink();
        }
        return AppLineChart(
          bioDataCMList: state.chartData.sublist(
              state.chartData.length > 10 ? state.chartData.length - 10 : 0),
        );
      },
    );
  }
}

class AppLineChartInputChips extends StatelessWidget {
  const AppLineChartInputChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.supportedChartType != current.supportedChartType ||
          previous.chartType != current.chartType,
      builder: (context, state) {
        return Wrap(
          spacing: 8.0,
          children: state.supportedChartType
              .map(
                (e) => InputChip(
                  label: Text(
                    context.l10n.profileChartTypeLabel(e.name),
                  ),
                  onSelected: (value) {
                    if (value) {
                      context.read<ProfileCubit>().updateChartType(e);
                    }
                  },
                  selected: state.chartType == e,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
