import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class SelectedFoodEmptyListText extends StatelessWidget {
  const SelectedFoodEmptyListText(
      {super.key, required this.filterDateTimeRange});

  final DateTimeRange filterDateTimeRange;

  String _timeText(DateTime? dateTime, BuildContext context) {
    final minutes = dateTime?.toLocal().minute.toString().padLeft(2, '0');
    final hour = dateTime?.toLocal().hour.toString().padLeft(2, '0');
    if (Directionality.of(context) == TextDirection.ltr) {
      return '$hour : $minutes';
    } else {
      return '$minutes : $hour';
    }
  }

  String _jalaliDayText(DateTime dateTime, BuildContext context) {
    final jalali = Jalali.fromDateTime(dateTime.toLocal());
    if (Directionality.of(context) == TextDirection.ltr) {
      return '${jalali.formatter.yyyy} / ${jalali.formatter.mm} / ${jalali.formatter.dd}';
    } else {
      return '${jalali.formatter.dd} / ${jalali.formatter.mm} / ${jalali.formatter.yyyy}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
            text: 'در بازه تاریخی زیر غذایی یافت نشد',
            style: context.themeData.textTheme.bodyMedium,
            children: [
              const TextSpan(text: '\n'),
              TextSpan(
                  text:
                      '${context.l10n.selectCustomDateTimeRangeDialogFromTime}  ${_timeText(filterDateTimeRange.start, context)}'),
              const TextSpan(text: '\n'),
              TextSpan(
                  text:
                      '${context.l10n.selectCustomDateTimeRangeDialogFromDate}  ${_jalaliDayText(filterDateTimeRange.start, context)}'),
              const TextSpan(text: '\n'),
              TextSpan(
                  text:
                      '${context.l10n.selectCustomDateTimeRangeDialogToTime}  ${_timeText(filterDateTimeRange.end, context)}'),
              const TextSpan(text: '\n'),
              TextSpan(
                  text:
                      '${context.l10n.selectCustomDateTimeRangeDialogToDate}  ${_jalaliDayText(filterDateTimeRange.end, context)}'),
            ]),
      ),
    );
  }
}
