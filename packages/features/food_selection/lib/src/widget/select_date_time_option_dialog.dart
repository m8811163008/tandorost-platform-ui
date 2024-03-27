import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SelectDateTimeOptionDialog extends StatelessWidget {
  const SelectDateTimeOptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(context.l10n.selectCustomDateTimeRangeDialogTitle),
      children: [
        SimpleDialogOption(
          child: Text(context.l10n.filterSelectedFoodsSelectDateTimeOptionRow1),
          onPressed: () {
            // from 9 hour later until yesterday midnight

            final end = DateTime.now().add(
              // TODO add to constants value
              const Duration(hours: 9),
            );
            final start = DateTime.now().copyWith(
              hour: 0,
              minute: 0,
              second: 0,
            );
            final dateRange = DateTimeRange(start: start, end: end);
            Navigator.of(context, rootNavigator: true)
                .pop<DateTimeRange>(dateRange);
          },
        ),
        SimpleDialogOption(
          child: Text(context.l10n.filterSelectedFoodsSelectDateTimeOptionRow2),
          onPressed: () {
            final now = DateTime.now().add(const Duration(hours: 9));
            final aWeekAgo = DateTime.now().subtract(const Duration(days: 7));

            final dateRange = DateTimeRange(start: aWeekAgo, end: now);
            Navigator.of(context, rootNavigator: true)
                .pop<DateTimeRange>(dateRange);
          },
        ),
        SimpleDialogOption(
          child: Text(context.l10n.filterSelectedFoodsSelectDateTimeOptionRow3),
          onPressed: () async {
            final pickedDate = await showDialog<DateTimeRange>(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                // TODO improve context why the next context doens have the bloc?
                return BlocProvider.value(
                    value: context.read<FoodSelectionBloc>(),
                    child: SelectCustomDateTimeRangeDialog());
              },
            );
            if (pickedDate == null || !context.mounted) return;

            Navigator.of(context, rootNavigator: true)
                .pop<DateTimeRange>(pickedDate);
          },
        ),
      ],
    );
  }
}
