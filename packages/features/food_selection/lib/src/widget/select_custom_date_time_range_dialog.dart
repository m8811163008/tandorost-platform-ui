import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

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
        .filterSelctedFoodsListDateTimeRange
        .start;
    _endDate = context
        .read<FoodSelectionBloc>()
        .state
        .filterSelctedFoodsListDateTimeRange
        .end;
    super.initState();
  }

  String _jalaliDayText(DateTime dateTime) {
    final jalali = Jalali.fromDateTime(dateTime.toLocal());
    return Directionality.of(context) == TextDirection.ltr
        ? '${jalali.formatter.yyyy} / ${jalali.formatter.mm} / ${jalali.formatter.dd}'
        : '${jalali.formatter.dd} / ${jalali.formatter.mm} / ${jalali.formatter.yyyy}';
  }

  String _timeText(DateTime? dateTime) {
    final minutes = dateTime?.toLocal().minute.toString().padLeft(2, '0');
    final hour = dateTime?.toLocal().hour.toString().padLeft(2, '0');
    return Directionality.of(context) == TextDirection.ltr
        ? '$hour : $minutes'
        : '$minutes : $hour';
  }

  Future<DateTime?> _showPersianDatePicker(Jalali initialDate) async {
    Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: Jalali(1402, 1),
      lastDate: Jalali(1406, 12),
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
            final selectedDateTime = await _showPersianDatePicker(_startDate.toJalali());
            if (selectedDateTime != null) {
              setState(
                () {
                  _startDate = _startDate.copyWith(
                    day: selectedDateTime.day,
                    year: selectedDateTime.year,
                    month: selectedDateTime.month,
                  );
                },
              );
            }
          },
        ),
        SimpleDialogOption(
          child: Text(
              '${context.l10n.selectCustomDateTimeRangeDialogFromTime}  ${_timeText(_startDate)}'),
          onPressed: () async {
            final timeOfDay = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(_startDate),
            );
            if (timeOfDay != null) {
              setState(() {
                _startDate = _startDate.copyWith(
                  hour: timeOfDay.hour,
                  minute: timeOfDay.minute,
                );
              });
            }
          },
        ),
        const Divider(),
        SimpleDialogOption(
          child: Text(
              '${context.l10n.selectCustomDateTimeRangeDialogToDate}  ${_jalaliDayText(_endDate)}'),
          onPressed: () async {
            final selectedDateTime = await _showPersianDatePicker(_endDate.toJalali());
            if (selectedDateTime != null) {
              setState(() {
                _endDate = _startDate.copyWith(
                  day: selectedDateTime.day,
                  year: selectedDateTime.year,
                  month: selectedDateTime.month,
                );
              });
            }
          },
        ),
        SimpleDialogOption(
          child: Text(
              '${context.l10n.selectCustomDateTimeRangeDialogToTime} ${_timeText(_endDate)}'),
          onPressed: () async {
            final timeOfDay = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(_endDate),
            );
            if (timeOfDay != null) {
              setState(() {
                _endDate = _startDate.copyWith(
                  hour: timeOfDay.hour,
                  minute: timeOfDay.minute,
                );
              });
            }
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
