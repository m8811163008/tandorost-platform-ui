import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';
import 'package:food_selection/src/selected_foods_list_page.dart';

class FoodSelectionRoute extends StatelessWidget {
  const FoodSelectionRoute({super.key});
  static const String routeName = '/food-selection';

  @override
  Widget build(BuildContext context) {
    return const FoodSelectionView();
  }
}

class FoodSelectionView extends StatelessWidget {
  const FoodSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      actions: [
        IconButton.filledTonal(
          onPressed: () {
            context.pushNamed(SelectedFoodsListPage.routeName);
          },
          icon: const Icon(
            Ionicons.list_sharp,
          ),
        )
      ],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SearchedFoodsList(),
          SearchFieldTextField(),
        ],
      ),
    );
  }
}

class SearchFieldTextField extends StatefulWidget {
  const SearchFieldTextField({super.key});

  @override
  State<SearchFieldTextField> createState() => _SeatchFoodTextFieldState();
}

class _SeatchFoodTextFieldState extends State<SearchFieldTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodSelectionBloc, FoodSelectionState>(
      listenWhen: (previous, current) =>
          previous.upsertSelectedFoodStatus != current.upsertSelectedFoodStatus,
      listener: (context, state) {
        if (state.upsertSelectedFoodStatus.isLoaded) {
          _controller.clear();
        }
      },
      child: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: context.l10n.foodSelectionScreenTextFieldHint,
          prefixIcon: const Icon(Icons.search),
        ),
        onChanged: (value) {
          context.read<FoodSelectionBloc>().add(SearchFood(value));
        },
        onSubmitted: (query) {
          context.read<FoodSelectionBloc>().add(SearchFood(query));
        },
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
    );
  }
}

class SearchedFoodsList extends StatelessWidget {
  const SearchedFoodsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const CircularProgressIndicator();
        } else if (state.status.isError) {
          return const Text('Error');
        } else if (state.status.isLoaded) {
          return SizedBox(
            height: context.sizesExtenstion.xExtraLarge,
            child: _buildSearchFoodList(state.foods),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildSearchFoodList(List<Food> foods) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return FoodButton(
          food: foods[index],
          onTap: () {
            context.read<FoodSelectionBloc>().add(FoodSelected(foods[index]));
            // navigation
            context.pushNamed(
              FoodAmountPage.routeName,
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: context.sizesExtenstion.small);
      },
    );
  }
}

class FoodButton extends StatelessWidget {
  const FoodButton({super.key, required this.food, this.onTap});
  final Food food;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(context.sizesExtenstion.medium),
          constraints: BoxConstraints.tight(
              Size.square(context.sizesExtenstion.xExtraLarge)),
          child: Center(
            child: Text(
              food.name,
              maxLines: 3,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ),
    );
  }
}
