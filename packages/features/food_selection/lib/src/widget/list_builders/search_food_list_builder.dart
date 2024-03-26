import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SearchedFoodsListBuilder extends StatelessWidget {
  const SearchedFoodsListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
      builder: (context, state) {
        if (state.searchFoodStatus.isLoading) {
          return const CircularProgressIndicator();
        } else if (state.searchFoodStatus.isError) {
          return const Text('Error');
        } else if (state.searchFoodStatus.isLoaded) {
          return SizedBox(
            height: context.sizesExtenstion.xExtraLarge,
            child: SearchFoodList(
              foods: state.searchedFoods,
              onTap: (food) {
                context.read<FoodSelectionBloc>().add(FoodSelected(food));
                // navigation
                context.pushNamed(
                  Routes.foodAmountInput,
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
