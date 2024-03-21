import 'package:component_library/component_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/src/bloc/food_selection_bloc.dart';

class SelectedFoodInfo extends StatelessWidget {
  const SelectedFoodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
        buildWhen: (previous, current) =>
            previous.selectedFood != current.selectedFood,
        builder: (context, state) {
          final numberOfMeasurement = state.selectedFood?.measurementUnitCount;
          final numberOfMeasurementLabelText =
              numberOfMeasurement != null ? numberOfMeasurement.toString() : '';
          final unitOfMeasuremnetTitle = numberOfMeasurement != null
              ? state.selectedFood?.unitOfMeasurement?.title ?? ''
              : '';
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  numberOfMeasurementLabelText,
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
                      Spacer(),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            state.selectedFood?.name ?? '',
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
