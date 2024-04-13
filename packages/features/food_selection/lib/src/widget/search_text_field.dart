import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SearchFieldTextField extends StatelessWidget {
  const SearchFieldTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: context.l10n.foodSelectionScreenTextFieldHint,
        prefixIcon: const Icon(Icons.search),
      ),
      onChanged: (value) {
        context.read<FoodSelectionBloc>().add(SearchFood(value));
      },
      onSubmitted: (query) {
        final serchedFoods =
            context.read<FoodSelectionBloc>().state.searchedFoods;
        if (serchedFoods.length != 1) return;
        context
            .read<FoodSelectionBloc>()
            .add(FoodSelected(serchedFoods.single));
        // navigation
        context.pushNamed(
          Routes.foodSelectionFoodAmountInput,
        );
      },
    );
  }
}
