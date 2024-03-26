import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SelectedFoodListBuilder extends StatelessWidget {
  const SelectedFoodListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
      buildWhen: (previous, current) =>
          previous.selectedFoodsList != current.selectedFoodsList,
      builder: (context, state) {
        if (state.selectedFoodsList.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SelectedFoodEmptyListText(
                  filterDateTimeRange:
                      state.filterSelctedFoodsListDateTimeRange,
                ),
              ),
              _buildEmptyListButton(context),
            ],
          );
        }
        List<SelectedFood> selectedFoods = state.selectedFoodsList;
        // To show last element to the top of the list.
        selectedFoods = selectedFoods.reversed.toList();
        return ListView.builder(
          itemCount: selectedFoods.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const SelectedFoodListBanner();
            }
            final selectedFood = selectedFoods[index - 1];

            return SelectedFoodListTileDissmissable(selectedFood: selectedFood);
          },
        );
      },
    );
  }

  Widget _buildEmptyListButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sizesExtenstion.medium),
      child: FloatingActionButton(
        child: Text('غذا اضافه کنید'),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
