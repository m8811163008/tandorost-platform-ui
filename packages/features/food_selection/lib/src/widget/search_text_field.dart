import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SearchFieldTextField extends StatefulWidget {
  const SearchFieldTextField({super.key});

  @override
  State<SearchFieldTextField> createState() => _SeatchFoodTextFieldState();
}

class _SeatchFoodTextFieldState extends State<SearchFieldTextField> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final isDrawerOpen =
        FoodSelectionView.scaffoldKey.currentState?.isDrawerOpen ?? false;
    final isCurrentPageFoodSelection =
        GoRouterState.of(context).uri.toString() == Routes.foodSelection;

    if (isDrawerOpen || !isCurrentPageFoodSelection) {
      _focus.unfocus();
    }
    return BlocListener<FoodSelectionBloc, FoodSelectionState>(
      listenWhen: (previous, current) =>
          previous.upsertSelectedFoodStatus != current.upsertSelectedFoodStatus,
      listener: (context, state) {
        if (state.upsertSelectedFoodStatus.isSuccess) {
          _controller.clear();
        }
      },
      child: TextField(
        controller: _controller,
        autofocus: true,
        focusNode: _focus,
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
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
    );
  }
}
