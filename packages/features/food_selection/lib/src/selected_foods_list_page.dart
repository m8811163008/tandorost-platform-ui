import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});
  static const String routeName = '/selected-foods-list';
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
      child: BlocConsumer<FoodSelectionBloc, FoodSelectionState>(
        listenWhen: (previous, current) =>
            previous.deleteSelectedFoodStatus !=
            current.deleteSelectedFoodStatus,
        listener: (context, state) {
          if (state.deleteSelectedFoodStatus.isLoaded) {
            context.showBanner(
                materialBanner: AppMaterialBanner(
              text: 'حذف شد',
              actions: [
                TextButton(
                  onPressed: () {
                    if (context.read<FoodSelectionBloc>().isClosed) return;
                    context
                        .read<FoodSelectionBloc>()
                        .add(SelectedFoodUndoRemoved());
                  },
                  child: Text(
                    'انصراف',
                    style: context.themeData.textTheme.labelMedium!.copyWith(
                        color: context.themeData.colorScheme.onSurface),
                  ),
                )
              ],
            ));
          }
        },
        buildWhen: (previous, current) =>
            previous.selectedFoodsList != current.selectedFoodsList,
        builder: (context, state) {
          if (state.selectedFoodsList.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                          text: 'در بازه تاریخی زیر غذایی یافت نشد',
                          style: context.themeData.textTheme.bodyMedium,
                          children: [
                            TextSpan(text: '\n'),
                            TextSpan(
                                text:
                                    '${context.l10n.selectCustomDateTimeRangeDialogFromTime}  ${_timeText(state.filterSelctedFoodsListDateTimeRange!.start, context)}'),
                            TextSpan(text: '\n'),
                            TextSpan(
                                text:
                                    '${context.l10n.selectCustomDateTimeRangeDialogFromDate}  ${_jalaliDayText(state.filterSelctedFoodsListDateTimeRange!.start, context)}'),
                            TextSpan(text: '\n'),
                            TextSpan(
                                text:
                                    '${context.l10n.selectCustomDateTimeRangeDialogToTime}  ${_timeText(state.filterSelctedFoodsListDateTimeRange!.end, context)}'),
                            TextSpan(text: '\n'),
                            TextSpan(
                                text:
                                    '${context.l10n.selectCustomDateTimeRangeDialogToDate}  ${_jalaliDayText(state.filterSelctedFoodsListDateTimeRange!.end, context)}'),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: context.sizesExtenstion.medium),
                  child: FloatingActionButton(
                    child: Text('غذا اضافه کنید'),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ],
            );
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

              return SelectedFoodListTileDissmissable(
                  selectedFood: selectedFood);
            },
          );
        },
      ),
    );
  }
}

class SelectedFoodListTileDissmissable extends StatelessWidget {
  const SelectedFoodListTileDissmissable(
      {super.key, required this.selectedFood});
  final SelectedFood selectedFood;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          context
              .read<FoodSelectionBloc>()
              .add(SelectedFoodRemoved(food: selectedFood));
        },
        background: Container(
          alignment: AlignmentDirectional.centerStart,
          color: context.themeData.colorScheme.surfaceTint,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Ionicons.trash_bin),
          ),
        ),
        child: SelectedFoodListTile(
          selectedFood: selectedFood,
        ),
      ),
    );
  }
}

class SelectedFoodListBanner extends StatelessWidget {
  const SelectedFoodListBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FoodSelectionBloc, FoodSelectionState,
            List<SelectedFood>>(
        selector: (state) => state.selectedFoodsList,
        builder: ((context, listSelectedFood) {
          final energySum = listSelectedFood.fold(
              0, (prev, current) => prev + current.calculateActualCalorie()!);
          final carbohydrateSum = listSelectedFood.fold(0.0,
              (prev, current) => prev + current.macroNutrition!.carbohydrate!);
          final fatSum = listSelectedFood.fold(
              0.0, (prev, current) => prev + current.macroNutrition!.fat!);
          final proteinSum = listSelectedFood.fold(
              0.0, (prev, current) => prev + current.macroNutrition!.protein!);
          final sum = carbohydrateSum + fatSum + proteinSum;
          final carbPercent = carbohydrateSum / sum;
          final fatPercent = fatSum / sum;
          final proteinPercent = proteinSum / sum;
          return Card(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${context.l10n.selectedFoodListBannerLabelEnergy} $energySum '),
                      Row(
                        children: [
                          _ChartLegend(color: CustomColor.carbohydrate),
                          Text(
                              '${context.l10n.nutritionDataCarbohydrateLabel} ${context.l10n.foodDataPercentValue(carbPercent)} '),
                        ],
                      ),
                      Row(
                        children: [
                          _ChartLegend(color: CustomColor.fat),
                          Text(
                              '${context.l10n.nutritionDataFatLabel} ${context.l10n.foodDataPercentValue(fatPercent)} '),
                        ],
                      ),
                      Row(
                        children: [
                          _ChartLegend(color: CustomColor.protein),
                          Text(
                              '${context.l10n.nutritionDataProteinLabel} ${context.l10n.foodDataPercentValue(proteinPercent)} '),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}

class _ChartLegend extends StatelessWidget {
  const _ChartLegend({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 8,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
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

            final end = DateTime.now().add(
              const Duration(hours: 6),
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
            final now = DateTime.now().add(
              const Duration(hours: 6),
            );
            final aWeekAgo = now.subtract(const Duration(days: 7));

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
    final jalali = Jalali.fromDateTime(dateTime.toLocal());
    if (Directionality.of(context) == TextDirection.ltr) {
      return '${jalali.formatter.yyyy} / ${jalali.formatter.mm} / ${jalali.formatter.dd}';
    } else {
      return '${jalali.formatter.dd} / ${jalali.formatter.mm} / ${jalali.formatter.yyyy}';
    }
  }

  String _timeText(DateTime? dateTime) {
    final minutes = dateTime?.toLocal().minute.toString().padLeft(2, '0');
    final hour = dateTime?.toLocal().hour.toString().padLeft(2, '0');
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
