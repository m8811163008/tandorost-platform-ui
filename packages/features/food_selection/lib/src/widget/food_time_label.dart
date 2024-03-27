import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class FoodTimeLabel extends StatelessWidget {
  const FoodTimeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FoodSelectionBloc, FoodSelectionState, Duration>(
      selector: (state) => state.saveTimeOffset,
      builder: (context, saveTimeOffset) {
        return Expanded(
          child: FoodTimeLabelText(
            saveTimeOffset: saveTimeOffset,
          ),
        );
      },
    );
  }
}
