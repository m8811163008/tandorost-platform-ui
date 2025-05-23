import 'package:component_library/component_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/src/food_selection_input/bloc/food_selection_bloc.dart';

class SelectedFoodInfo extends StatelessWidget {
  const SelectedFoodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
        buildWhen: (previous, current) =>
            previous.selectedFood != current.selectedFood,
        builder: (context, state) {
          final selectedUnitOfMeasurement =
              state.selectedFood.unitOfMeasurmentCM;

          final measurementUnitCount =
              state.selectedFood.numberOfUnitOfMeasurement;
          final unitOfMeasuremnetTitle = context.l10n
              .unitOfMeasurementTitle(selectedUnitOfMeasurement.title);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '$measurementUnitCount',
                  style: context.themeData.textTheme.displayLarge!
                      .apply(fontSizeFactor: 2),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: SizedBox.square(
                          dimension: 200,
                          child: FittedBox(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              unitOfMeasuremnetTitle,
                              style: context.themeData.textTheme.displaySmall,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FittedBox(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            state.selectedFood.food.name,
                            maxLines: 2,
                            style: context.themeData.textTheme.displaySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
