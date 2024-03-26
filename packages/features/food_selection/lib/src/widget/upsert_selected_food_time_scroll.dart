import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class TimeScrolleInput extends StatelessWidget {
  const TimeScrolleInput({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 35.7 * 1.68),
      child: ScrollableNumberInput(
        axis: Axis.horizontal,
        itemExtends: 35.7,
        // TODO add to application constants.
        min: -9,
        max: 9,
        offAxisFraction: 0.5,
        onSelectedNumberChanged: (value) {
          context.read<FoodSelectionBloc>().add(
                SelectedFoodUpdated(
                  saveEatDateTimeOffset: Duration(hours: value),
                ),
              );
        },
      ),
    );
  }
}
