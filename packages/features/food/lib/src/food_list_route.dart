import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/src/bloc/food_bloc.dart';
import 'package:food_repository/food_repository.dart';

class FoodsListRoute extends StatelessWidget {
  const FoodsListRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FoodBloc(RepositoryProvider.of<FoodRepostiory>(context)),
      child: FoodListView(),
    );
  }
}

class FoodListView extends StatelessWidget {
  const FoodListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawer: true,
      actions: [
        IconButton(
          icon: const Icon(Ionicons.add),
          onPressed: () async {
            // show bottom sheet for creating a new food
          },
        ),
      ],
      child: BlocConsumer<FoodBloc, FoodState>(
        listenWhen: (previous, current) =>
            previous.deleteFoodStatus != current.deleteFoodStatus,
        listener: (context, state) {
          if (state.deleteFoodStatus.isLoaded) {
            context.showBanner(
                materialBanner: AppMaterialBanner(
              text: 'حذف شد',
              actions: [
                TextButton(
                  onPressed: () {
                    if (context.read<FoodBloc>().isClosed) return;
                    context.read<FoodBloc>().add(FoodUndoRemoved());
                  },
                  child: Text(
                    'انصراف',
                    style: context.themeData.textTheme.labelMedium!.copyWith(
                        color: context.themeData.colorScheme.onSurface),
                  ),
                )
              ],
            ));
          }
        },
        buildWhen: (previous, current) =>
            previous.foodsList != current.foodsList,
        builder: (context, state) {
          if (state.foodsList.isEmpty) {
            return Center(child: Text('غذایی یافت نشد'));
          }
          List<Food> foods = state.foodsList;
          foods = foods.reversed.toList();
          return ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final food = foods[index - 1];

              return FoodListTile(food: food);
            },
          );
        },
      ),
    );
  }
}

class FoodListTile extends StatelessWidget {
  const FoodListTile({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(food.name),
      ),
    );
  }
}
