import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/src/bloc/food_selection_bloc.dart';

class SelectedFoodInfo extends StatelessWidget {
  const SelectedFoodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
          buildWhen: (previous, current) =>
              previous.selectedFood != current.selectedFood,
          builder: (context, state) {
            final numberOfMeasurement =
                state.selectedFood?.measurementUnitCount;
            final numberOfMeasurementLabelText = numberOfMeasurement != null
                ? numberOfMeasurement.toString()
                : '';
            final unitOfMeasuremnetTitle = numberOfMeasurement != null
                ? state.selectedFood?.unitOfMeasurement?.title ?? ''
                : '';
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  numberOfMeasurementLabelText,
                  style: context.themeData.textTheme.displayLarge!
                      .apply(fontSizeFactor: 2),
                ),
                SizedBox(
                  width: context.sizesExtenstion.medium,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        unitOfMeasuremnetTitle,
                        style: context.themeData.textTheme.displaySmall,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        state.selectedFood?.name ?? '',
                        style: context.themeData.textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            );
          }),
    );
  }
}
