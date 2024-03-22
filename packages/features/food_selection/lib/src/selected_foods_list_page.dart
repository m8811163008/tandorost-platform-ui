import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});
  static const String routeName = '/selected-foods-list';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      actions: [
        IconButton(
          icon: const Icon(Ionicons.calendar),
          onPressed: () async {
            final DateTimeRange? filterDateTimeRange =
                await showDialog<DateTimeRange>(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                    value: context.read<FoodSelectionBloc>(),
                    child: const SelectDateTimeOptionDialog());
              },
            );
            if (filterDateTimeRange == null) return;
            if (!context.mounted) return;
            context.read<FoodSelectionBloc>().add(
                  SlectedFoodListFiltered(dateTimeRange: filterDateTimeRange),
                );
          },
        ),
      ],
      child: BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
        buildWhen: (previous, current) =>
            previous.selectedFoodsList != current.selectedFoodsList,
        builder: (context, state) {
          if (state.selectedFoodsList.isEmpty) {
            return const Text('empty List');
          }
          List<SelectedFood> selectedFoods = state.selectedFoodsList;
          selectedFoods = selectedFoods.reversed.toList();
          return ListView.builder(
            itemCount: selectedFoods.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const SelectedFoodListBanner();
              }
              final selectedFood = selectedFoods[index - 1];

              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SelectedFoodListTile(
                  selectedFood: selectedFood,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SelectedFoodListBanner extends StatelessWidget {
  const SelectedFoodListBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TotalNutitionsPieChart(
              fat: 10,
              carbohydrate: 15,
              protein: 64,
            ),
            Text('جمع ⚡️ 123 کیلوکالری')
          ],
        ),
      ),
    );
  }
}

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
            // from 6 hour later until yesterday midnight
            final now = DateTime.now().add(Duration(hours: 6));
            final yesterdayMidnight = now.copyWith(
                hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
            final dateRange = DateTimeRange(start: yesterdayMidnight, end: now);
            Navigator.of(context, rootNavigator: true)
                .pop<DateTimeRange>(dateRange);
          },
        ),
        SimpleDialogOption(
          child: Text(context.l10n.filterSelectedFoodsSelectDateTimeOptionRow2),
          onPressed: () {
            final now = DateTime.now();
            final aWeekAgo = now.subtract(const Duration(days: 7));
            // Cache of selected foods always use UTC.
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
                return BlocProvider.value(
                    value: context.read<FoodSelectionBloc>(),
                    child: const SelectCustomDateTimeRangeDialog());
              },
            );
            if (pickedDate != null && context.mounted) {
              Navigator.of(context, rootNavigator: true)
                  .pop<DateTimeRange>(pickedDate);
            }
          },
        ),
      ],
    );
  }
}

class SelectCustomDateTimeRangeDialog extends StatefulWidget {
  const SelectCustomDateTimeRangeDialog({super.key});

  @override
  State<SelectCustomDateTimeRangeDialog> createState() =>
      _SelectCustomDateTimeRangeDialogState();
}

class _SelectCustomDateTimeRangeDialogState
    extends State<SelectCustomDateTimeRangeDialog> {
  late DateTime _startDate;
  late DateTime _endDate;
  @override
  void initState() {
    _startDate = context
        .read<FoodSelectionBloc>()
        .state
        .filterSelctedFoodsListDateTimeRange!
        .start;
    _endDate = context
        .read<FoodSelectionBloc>()
        .state
        .filterSelctedFoodsListDateTimeRange!
        .end;
    super.initState();
  }

  String _jalaliDayText(DateTime dateTime) {
    final jalali = Jalali.fromDateTime(dateTime);
    if (Directionality.of(context) == TextDirection.ltr) {
      return '${jalali.formatter.yyyy} / ${jalali.formatter.mm} / ${jalali.formatter.dd}';
    } else {
      return '${jalali.formatter.dd} / ${jalali.formatter.mm} / ${jalali.formatter.yyyy}';
    }
  }

  String _timeText(DateTime? dateTime) {
    final minutes = dateTime?.minute.toString().padLeft(2, '0');
    final hour = dateTime?.hour.toString().padLeft(2, '0');
    if (Directionality.of(context) == TextDirection.ltr) {
      return '$hour : $minutes';
    } else {
      return '$minutes : $hour';
    }
  }

  Future<DateTime?> _showPersianDatePicker() async {
    Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1385, 8),
      lastDate: Jalali(1450, 9),
    );
    return picked?.toDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(context.l10n.selectCustomDateTimeRangeDialogTitle),
      children: [
        SimpleDialogOption(
          child: Text(
              '${context.l10n.selectCustomDateTimeRangeDialogFromDate}  ${_jalaliDayText(_startDate)}'),
          onPressed: () async {
            final selectedDateTime = await _showPersianDatePicker();
            setState(() {
              _startDate = _startDate.copyWith(
                day: selectedDateTime?.day,
                year: selectedDateTime?.year,
                month: selectedDateTime?.month,
              );
            });
          },
        ),
        SimpleDialogOption(
          child: Text(
              '${context.l10n.selectCustomDateTimeRangeDialogFromTime}  ${_timeText(_startDate)}'),
          onPressed: () async {
            final timeOfDay = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            setState(() {
              _startDate = _startDate.copyWith(
                hour: timeOfDay?.hour,
                minute: timeOfDay?.minute,
              );
            });
          },
        ),
        const Divider(),
        SimpleDialogOption(
          child: Text(
              '${context.l10n.selectCustomDateTimeRangeDialogToDate}  ${_jalaliDayText(_endDate)}'),
          onPressed: () async {
            final selectedDateTime = await _showPersianDatePicker();
            setState(() {
              _endDate = _endDate.copyWith(
                day: selectedDateTime?.day,
                year: selectedDateTime?.year,
                month: selectedDateTime?.month,
              );
            });
          },
        ),
        SimpleDialogOption(
          child: Text(
              '${context.l10n.selectCustomDateTimeRangeDialogToTime} ${_timeText(_endDate)}'),
          onPressed: () async {
            final timeOfDay = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            setState(() {
              _endDate = _endDate.copyWith(
                  hour: timeOfDay?.hour, minute: timeOfDay?.minute);
            });
          },
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                onPressed: !_startDate.isAfter(_endDate)
                    ? () {
                        final dateRange =
                            DateTimeRange(start: _startDate, end: _endDate);

                        Navigator.of(context, rootNavigator: true)
                            .pop(dateRange);
                      }
                    : null,
                child: Text(context.l10n.buttonConfirmText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text(context.l10n.buttonCancleText),
              ),
            ),
          ],
        )
      ],
    );
  }
}
