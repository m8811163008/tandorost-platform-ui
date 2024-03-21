import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});
  static const String routeName = '/selected-foods-list';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
        buildWhen: (previous, current) =>
            previous.selectedFoodsList != current.selectedFoodsList,
        builder: (context, state) {
          if (state.selectedFoodsList.isEmpty) {
            return Text('empty List');
          }
          return ListView.builder(
            itemCount: state.selectedFoodsList.length,
            itemBuilder: (context, index) {
              final selectedFood = state.selectedFoodsList[index];

              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SelectedFoodListTile(
                  selectedFood: selectedFood,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
