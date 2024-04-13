import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';
import 'package:food_selection/src/selected_foods_list/cubit/selected_foods_list_cubit.dart';

class SelectedFoodListBuilder extends StatelessWidget {
  const SelectedFoodListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectedFoodsListCubit, SelectedFoodsListState>(
      listenWhen: (previous, current) =>
          previous.deleteSelectedFoodStatus != current.deleteSelectedFoodStatus,
      listener: (context, state) {
        if (state.deleteSelectedFoodStatus.isSuccess) {
          context.showBanner(
            materialBanner: AppMaterialBanner(
              text: 'حذف شد',
              actions: [
                TextButton(
                  onPressed: () {
                    if (context.read<SelectedFoodsListCubit>().isClosed) return;
                    context
                        .read<SelectedFoodsListCubit>()
                        .selectedFoodUndoRemoved();
                  },
                  child: Text(
                    'انصراف',
                    style: context.themeData.textTheme.labelMedium!.copyWith(
                        color: context.themeData.colorScheme.onSurface),
                  ),
                )
              ],
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.selectedFoodsList != current.selectedFoodsList ||
          previous.selectedFoodsForNewFood != current.selectedFoodsForNewFood,
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
        List<SelectedFoodCM> selectedFoods = state.selectedFoodsList;
        // To show last element to the top of the list.
        selectedFoods = selectedFoods.reversed.toList();
        return ListView.builder(
          itemCount: selectedFoods.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const SelectedFoodListBanner();
            }
            final selectedFood = selectedFoods[index - 1];

            return SelectedFoodListTileDissmissable(
              food: selectedFood,
              isDismissActive: state.selectedFoodsForNewFood.isEmpty,
              onDissmiss: () {
                context
                    .read<SelectedFoodsListCubit>()
                    .foodSelectedForNewFood(selectedFood);
              },
              onLongPressed: () {
                context
                    .read<SelectedFoodsListCubit>()
                    .foodSelectedForNewFood(selectedFood);
              },
              onTap: () {
                if (state.selectedFoodsForNewFood.isNotEmpty) {
                  context
                      .read<SelectedFoodsListCubit>()
                      .foodSelectedForNewFood(selectedFood);
                }
              },
              isSelcted: state.selectedFoodsForNewFood.contains(selectedFood),
            );
          },
        );
      },
    );
  }

  Widget _buildEmptyListButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sizesExtenstion.medium),
      child: FloatingActionButton(
        child: const Text('غذا اضافه کنید'),
        onPressed: () {
          //TODO fix this navigation
          // context.pop();
        },
      ),
    );
  }
}
