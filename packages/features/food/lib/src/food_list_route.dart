import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/food.dart';
import 'package:food/src/bloc/food_bloc.dart';
import 'package:food_repository/food_repository.dart';

class FoodsListRoute extends StatelessWidget {
  const FoodsListRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FoodBloc(RepositoryProvider.of<FoodRepostiory>(context)),
      child: const FoodListView(),
    );
  }
}

class FoodListView extends StatefulWidget {
  const FoodListView({super.key});

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  void _showBottomSheet(String newFoodName) {
    // Show the form when user push to this page to add new food from the
    // food selection feature. we checked the extra of GoRouterState if
    // it set then we get the newFoodName and check if the food is already
    // exist in food so we show the update view of food otherwise we show
    // insert new food view.
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: true,
      isDismissible: true,
      builder: (_) => UpsertFoodBottomSheet(
        onfoodUpdated: (food) {
          context.read<FoodBloc>().add(FoodUpserted(food: food));
        },
        initalName: newFoodName,
        initalFood: context.read<FoodBloc>().state.foodsList.singleWhere(
              (element) => element.name == newFoodName,
              orElse: () => FoodCM.empty(),
            ),
      ),
    );
  }

  // Method to create FoodListTile
  Widget _createFoodListTile(FoodCM food, BuildContext context) {
    return FoodListTile(
      food: food,
      onFoodUpdate: (food) {
        context.read<FoodBloc>().add(FoodUpserted(food: food));
      },
      onFoodDelete: (food) {
        context.read<FoodBloc>().add(FoodDeleted(food: food));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodBloc, FoodState>(
      listenWhen: (previous, current) =>
          previous.newFoodNameFromFoodSelection !=
          current.newFoodNameFromFoodSelection,
      listener: (context, state) {
        _showBottomSheet(state.newFoodNameFromFoodSelection);
      },
      child: AppScaffold(
        isShowDrawerButton: true,
        actions: [
          SizedBox(
            width: 120,
            child: TextField(
              autofocus: false,
              style: context.themeData.textTheme.bodySmall,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'جستجو غذا',
                hintStyle: context.themeData.textTheme.bodySmall,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
              ),
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              // controller: _controller,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.search,
            ),
          ),
          TextButton.icon(
            icon: const Icon(Ionicons.add),
            label: const Text('خوراک جدید'),
            onPressed: () async {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                enableDrag: true,
                showDragHandle: true,
                isDismissible: true,
                builder: (_) => UpsertFoodBottomSheet(
                  onfoodUpdated: (food) {
                    context.read<FoodBloc>().add(FoodUpserted(food: food));
                  },
                ),
              );
            },
          ),
        ],
        child: BlocConsumer<FoodBloc, FoodState>(
          listenWhen: (previous, current) =>
              previous.deleteFoodStatus != current.deleteFoodStatus,
          listener: (context, state) {
            if (state.deleteFoodStatus.isSuccess) {
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
                  ),
                ],
              ));
            }
          },
          buildWhen: (previous, current) =>
              previous.foodsList != current.foodsList,
          builder: (context, state) {
            // return const Center(child: Text('غذایی یافت نشد'));
            if (state.foodsList.isEmpty) {
              return const Center(child: Text('غذایی یافت نشد'));
            }
            List<FoodCM> foods = state.foodsList;
            // foods = foods.reversed
            //     .where((element) => element.name.contains(_controller.text))
            //     .toList();
            return ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return _createFoodListTile(food, context);
              },
            );
          },
        ),
      ),
    );
  }
}
