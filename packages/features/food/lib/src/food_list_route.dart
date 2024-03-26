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
      child: FoodListView(),
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
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawer: true,
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
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
            ),
            onChanged: (chearchTerm) {
              setState(() {});
            },
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
            return Center(child: Text('غذایی یافت نشد'));
          }
          List<Food> foods = state.foodsList;
          foods = foods.reversed
              .where((element) => element.name.contains(_controller.text))
              .toList();
          return ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final food = foods[index];

              return FoodListTile(food: food);
            },
          );
        },
      ),
    );
  }
}

class FoodListTile extends StatefulWidget {
  const FoodListTile({super.key, required this.food});
  final Food food;

  @override
  State<FoodListTile> createState() => _FoodListTileState();
}

class _FoodListTileState extends State<FoodListTile>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final fat = widget.food.macroNutrition?.fat ?? 0;
    final carbohydrate = widget.food.macroNutrition?.carbohydrate ?? 0;
    final protein = widget.food.macroNutrition?.protein ?? 0;
    final percentConstant = 1 / (fat + carbohydrate + protein);

    final selectedFoodCalarieLabel =
        '${widget.food.calorie} ${context.l10n.foodDataCalarieLabel}';
    final selectedFoodFatLabel =
        '${context.l10n.foodDataPercentValue(fat * percentConstant)} ${context.l10n.nutritionDataFatLabel}';
    final selectedFoodProteinLabel =
        '${context.l10n.foodDataPercentValue(protein * percentConstant)} ${context.l10n.nutritionDataProteinLabel}';
    final selectedFoodCarbohydrateLabel =
        '${context.l10n.foodDataPercentValue(carbohydrate * percentConstant)} ${context.l10n.nutritionDataCarbohydrateLabel}';

    return Card(
      child: ListTile(
        title: Text(widget.food.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  enableDrag: true,
                  showDragHandle: true,
                  isDismissible: true,
                  builder: (_) => UpsertFoodBottomSheet(
                    onfoodUpdated: (food) {
                      context.read<FoodBloc>().add(FoodUpdate(food: food));
                    },
                    initalFood: widget.food,
                  ),
                );
              },
              visualDensity: VisualDensity.compact,
              icon: Icon(Ionicons.options),
            ),
            IconButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text('حذف غذا'),
                        content: Text(
                            'آیا از حذف ${widget.food.name} اطمینان دارید؟'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('انصراف'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              context
                                  .read<FoodBloc>()
                                  .add(FoodDeleted(food: widget.food));
                            },
                            child: Text('حذف'),
                          ),
                        ],
                      );
                    });
              },
              visualDensity: VisualDensity.compact,
              icon: Icon(Ionicons.trash_bin),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(selectedFoodCalarieLabel),
                    const Spacer(),
                    Text(
                      selectedFoodFatLabel,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedFoodProteinLabel,
                    ),
                    const Spacer(),
                    Text(
                      selectedFoodCarbohydrateLabel,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
