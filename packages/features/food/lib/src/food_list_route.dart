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
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  // Method to create FoodListTile
  Widget _createFoodListTile(Food food, BuildContext context) {
    return FoodListTile(
      food: food,
      onFoodUpdate: (food) {
        context.read<FoodBloc>().add(FoodUpdate(food: food));
      },
      onFoodDelete: (food) {
        context.read<FoodBloc>().add(FoodDeleted(food: food));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
            controller: _controller,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.search,
          ),
        ),
        IconButton.outlined(
          icon: const Icon(Ionicons.add),
          onPressed: () async {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              enableDrag: true,
              showDragHandle: true,
              isDismissible: true,
              builder: (_) => UpsertFoodBottomSheet(
                onfoodUpdated: (food) {
                  context.read<FoodBloc>().add(FoodUpdate(food: food));
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
                ),
              ],
            ));
          }
        },
        buildWhen: (previous, current) =>
            previous.foodsList != current.foodsList,
        builder: (context, state) {
          if (state.foodsList.isEmpty) {
            return const Center(child: Text('غذایی یافت نشد'));
          }
          List<Food> foods = state.foodsList;
          foods = foods.reversed
              .where((element) => element.name.contains(_controller.text))
              .toList();
          return ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final food = foods[index];
              return _createFoodListTile(food, context);
            },
          );
        },
      ),
    );
  }
}