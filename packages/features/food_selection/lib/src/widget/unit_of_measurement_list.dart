import 'package:component_library/component_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class UnitOfMeasurementAlign extends StatelessWidget {
  const UnitOfMeasurementAlign({super.key, this.height = 176});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1.3 / 3,
      height: height,
      child: const UnitOfMeasurementsWidget(),
    );
  }
}

class UnitOfMeasurementsWidget extends StatelessWidget {
  const UnitOfMeasurementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
      buildWhen: (previous, current) =>
          previous.unitOfMesurementList != current.unitOfMesurementList,
      builder: (context, state) {
        if (state.unitOfMesurementList.isEmpty) {
          return const SizedBox.shrink();
        }
        return UnitOfMusurementsGrid(
          list: state.unitOfMesurementList,
          onSelected: (selectedUnitOfMeasurement) {
            context.read<FoodSelectionBloc>().add(
                  SelectedFoodUpdated(
                    unitOfMeasurement: selectedUnitOfMeasurement,
                  ),
                );
          },
        );
      },
    );
  }
}
