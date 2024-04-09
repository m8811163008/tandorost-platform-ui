import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class FoodAmountInputNumber extends StatelessWidget {
  const FoodAmountInputNumber({super.key});

  @override
  Widget build(BuildContext context) {
    const extend = 104.0;
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        // width: extend * 1.68,
        height: extend * 2.5,
      ),
      child: BlocSelector<FoodSelectionBloc, FoodSelectionState,
          UnitOfMeasurement>(
        selector: (state) {
          final unitOfMeasurmentCM = state.selectedFood.unitOfMeasurmentCM;
          return state.unitOfMesurementList.singleWhere(
              (element) => element.title.name == unitOfMeasurmentCM.title);
        },
        builder: (context, unitOfMeasurement) {
          final max = unitOfMeasurement.max ?? 100;
          final min = max <= 300 ? 1 : 10;
          final step = (max - min) <= 300 ? 1 : 10;
          final intialValue = context
              .read<FoodSelectionBloc>()
              .state
              .unitOfMeasurementHistory[unitOfMeasurement];
          if (intialValue != null) {
            context.read<FoodSelectionBloc>().add(
                  SelectedFoodUpdated(
                    measurementUnitCount: intialValue,
                  ),
                );
          }

          return ScrollableNumberInput(
            key: UniqueKey(),
            min: min,
            max: max,
            step: step,
            itemExtends: extend,
            onSelectedNumberChanged: (value) {
              context.read<FoodSelectionBloc>()
                ..add(
                  SelectedFoodUpdated(
                    measurementUnitCount: value,
                  ),
                )
                ..add(
                  UnitOfMeasurementAmountChanged(
                    amount: value,
                    unitOfMeasurement: unitOfMeasurement,
                  ),
                );
            },
            intialValue: intialValue,
          );
        },
      ),
    );
  }
}
