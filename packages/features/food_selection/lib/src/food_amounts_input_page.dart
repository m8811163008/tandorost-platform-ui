import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class FoodAmountPage extends StatelessWidget {
  const FoodAmountPage({super.key});

  static const String routeName = 'input-food-amount';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SelectedFoodInfo(),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          UnitOfMusurementAlign(),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          Expanded(
            flex: 2,
            child: FoodAmountInputNumber(),
          ),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                FoodTimeInput(),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  // final state =
                                  //     context.read<FoodSelectionBloc>().state;
                                  // print(state);
                                },
                                child: const Text('ذخیره و تاریخچه'))),
                        SizedBox(
                          width: context.sizesExtenstion.medium,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // save the food
                              // reset the state
                              // pop the page
                            },
                            child: const Text('ذخیره و غذای بعد'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UnitOfMusurementAlign extends StatelessWidget {
  const UnitOfMusurementAlign({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1.3 / 3,
        height: 176,
        child: BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
          builder: (context, state) {
            return UnitOfMusurementList(
              list: context.select<FoodSelectionBloc, List<UnitOfMeasurement>>(
                (bloc) => bloc.state.unitOfMesurementList,
              ),
              onSelected: (selectedUnitOfMeasurement) {
                context.read<FoodSelectionBloc>().add(
                      SelectedFoodUpdated(
                        unitOfMeasurement: selectedUnitOfMeasurement,
                      ),
                    );
              },
            );
          },
        ),
      ),
    );
  }
}

class FoodAmountInputNumber extends StatelessWidget {
  const FoodAmountInputNumber({super.key});

  @override
  Widget build(BuildContext context) {
    const extend = 104.0;
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        width: extend * 1.68,
        height: extend * 2.5,
      ),
      child: BlocSelector<FoodSelectionBloc, FoodSelectionState,
          UnitOfMeasurement?>(
        selector: (bloc) {
          return bloc.selectedFood?.unitOfMeasurement;
        },
        builder: (context, unitOfMeasurement) {
          final max = unitOfMeasurement?.max ?? 100;
          final min = max <= 300 ? 1 : 10;
          final step = (max - min) <= 300 ? 1 : 10;

          return ScrollableNumberInput(
            key: UniqueKey(),
            min: min,
            max: max,
            step: step,
            itemExtends: extend,
            onSelectedNumberChanged: (value) {
              context.read<FoodSelectionBloc>().add(
                    SelectedFoodUpdated(
                      measurementUnitCount: value,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}

class FoodTimeInput extends StatelessWidget {
  const FoodTimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FoodTimeLabel(),
          SizedBox(
            width: context.sizesExtenstion.medium,
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(height: 35.7 * 1.68),
              child: TimeScrolleInput(),
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodTimeLabel extends StatelessWidget {
  const _FoodTimeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FoodSelectionBloc, FoodSelectionState, Duration>(
      selector: (state) => state.saveTimeOffset,
      builder: (context, saveTimeOffset) {
        return Expanded(
          child: RichText(
            text: TextSpan(
              text: context.l10n.foodTimeInputDateTimeLabelText(
                  saveTimeOffset.toTimeStatus().name),
              style: context.themeData.textTheme.bodyMedium,
              children: [
                TextSpan(text: '\n'),
                if (saveTimeOffset.inHours != 0)
                  WidgetSpan(
                    child: SizedBox(
                      width: 16,
                      child: Text(saveTimeOffset.inHours.abs().toString()),
                    ),
                  ),
                TextSpan(
                  text: context.l10n.foodTimeInputDateTimeLabelVelue(
                      saveTimeOffset.toTimeStatus().name),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum _TimeStatus { past, now, future }

extension on Duration {
  _TimeStatus toTimeStatus() {
    if (inHours == 0) {
      return _TimeStatus.now;
    } else {
      return isNegative ? _TimeStatus.past : _TimeStatus.future;
    }
  }
}

class TimeScrolleInput extends StatefulWidget {
  const TimeScrolleInput({super.key});

  @override
  State<TimeScrolleInput> createState() => _TimeScrolleInputState();
}

class _TimeScrolleInputState extends State<TimeScrolleInput> {
  @override
  Widget build(BuildContext context) {
    return ScrollableNumberInput(
      axis: Axis.horizontal,
      itemExtends: 35.7,
      min: -5,
      max: 5,
      offAxisFraction: 0.5,
      onSelectedNumberChanged: (value) {
        final bloc = context.read<FoodSelectionBloc>();
        if (bloc.state.selectedFood == null) return;

        context.read<FoodSelectionBloc>().add(
              SelectedFoodUpdated(
                saveEatDateTimeOffset: Duration(hours: value),
              ),
            );
      },
    );
  }
}
