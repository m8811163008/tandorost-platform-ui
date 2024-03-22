import 'package:component_library/component_library.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});
  static const String routeName = '/selected-foods-list';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
        buildWhen: (previous, current) =>
            previous.selectedFoodsList != current.selectedFoodsList,
        builder: (context, state) {
          if (state.selectedFoodsList.isEmpty) {
            return Text('empty List');
          }
          return ListView.builder(
            itemCount: state.selectedFoodsList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SelectedFoodListBanner();
              }
              final selectedFood = state.selectedFoodsList[index - 1];

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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TotalNutitionsPieChart(
              fat: 10,
              carbohydrate: 15,
              protein: 64,
            ),
            SizedBox.square(
              dimension: 104,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionChip(
                    label: Text('dateTime'),
                    onPressed: () async {
                      final DateTimeRange? filterDateTimeRange =
                          await showDialog<DateTimeRange>(
                        context: context,
                        builder: (context) {
                          return SelectDateTimeOptionDialog();
                        },
                      );
                      if (filterDateTimeRange == null) return;
                      if (!context.mounted) return;
                      context.read<FoodSelectionBloc>().add(
                            SlectedFoodListFiltered(
                                dateTimeRange: filterDateTimeRange),
                          );
                    },
                  ),
                  Text('جمع ⚡️ 123 کیلوکالری')
                ],
              ),
            )
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
      title: Text('انتخاب تاریخ'),
      children: [
        SimpleDialogOption(
          child: Text('تا دیشب ساعت 00:00'),
          onPressed: () {
            final now = DateTime.now();
            final yesterdayMidnight = now.copyWith(
                hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
            final dateRange = DateTimeRange(
                start: yesterdayMidnight.toUtc(), end: now.toUtc());
            Navigator.of(context, rootNavigator: true)
                .pop<DateTimeRange>(dateRange);
          },
        ),
        SimpleDialogOption(
          child: Text('از الان تا 7 روز پیش'),
          onPressed: () {
            final now = DateTime.now();
            final aWeekAgo = now.subtract(Duration(days: 7));
            // Cache of selected foods always use UTC.
            final dateRange =
                DateTimeRange(start: aWeekAgo.toUtc(), end: now.toUtc());
            Navigator.of(context, rootNavigator: true)
                .pop<DateTimeRange>(dateRange);
          },
        ),
        SimpleDialogOption(
          child: Text('انتخاب بازه زمانی'),
          onPressed: () async {
            final pickedDate = await showDialog<DateTimeRange>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return SelectCustomDateTimeRangeDialog();
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
    _startDate = DateTime.now().subtract(Duration(days: 7));
    _endDate = DateTime.now();
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
    if (Directionality.of(context) == TextDirection.ltr) {
      return '${dateTime?.hour} : ${dateTime?.minute}';
    } else {
      return '${dateTime?.minute} : ${dateTime?.hour}';
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
              _startDate = _startDate
                  .copyWith(
                    hour: timeOfDay?.hour,
                    minute: timeOfDay?.minute,
                  )
                  .toUtc();
            });
          },
        ),
        Divider(),
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
              _endDate = _endDate
                  .copyWith(hour: timeOfDay?.hour, minute: timeOfDay?.minute)
                  .toUtc();
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
