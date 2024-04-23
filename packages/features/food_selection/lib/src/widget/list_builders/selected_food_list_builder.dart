import 'package:auth_repository/auth_repository.dart';
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
    final cubit = context.read<SelectedFoodsListCubit>();
    return BlocConsumer<SelectedFoodsListCubit, SelectedFoodsListState>(
      listenWhen: (previous, current) =>
          previous.deleteSelectedFoodStatus != current.deleteSelectedFoodStatus,
      listener: (_, state) {
        if (state.deleteSelectedFoodStatus.isSuccess) {
          context.showSnackbar(
            snackBar: SnackBar(
              content: const Text('حذف شد'),
              action: SnackBarAction(
                label: 'انصراف',
                onPressed: cubit.selectedFoodUndoRemoved,
              ),
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.selectedFoodsList != current.selectedFoodsList ||
          previous.selectedFoodsForNewFood != current.selectedFoodsForNewFood ||
          previous.dayActivityLevel != current.dayActivityLevel,
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ListBanner(),
                  _NutritionFact(),
                ],
              );
            }
            final selectedFood = selectedFoods[index - 1];

            return SelectedFoodListTileDissmissable(
              food: selectedFood,
              isDismissActive: state.selectedFoodsForNewFood.isEmpty,
              onDissmiss: () {
                context
                    .read<SelectedFoodsListCubit>()
                    .selectedFoodRemoved(selectedFood);
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
          context.goNamed(Routes.foodSelection);
        },
      ),
    );
  }
}

class _ListBanner extends StatelessWidget {
  const _ListBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isUserHasProfile =
        context.read<SelectedFoodsListCubit>().state.profileCM !=
            const ProfileCM.empty();
    return UserRoleVisibility(
      userRoleStream: RepositoryProvider.of<AuthRepostiory>(context)
          .currentUserRulesStream(),
      dieterWidget: isUserHasProfile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const DayActivityLevelSegementedButton(),
                //if paid customer
                const SelectedFoodListBannerPaid(),
              ],
            )
          : SelectedFoodListBanner(),
      foodTrackerWidget: const SelectedFoodListBanner(),
    );
  }
}

class _NutritionFact extends StatelessWidget {
  const _NutritionFact({super.key});

  @override
  Widget build(BuildContext context) {
    final isUserHasProfile =
        context.read<SelectedFoodsListCubit>().state.profileCM !=
            const ProfileCM.empty();
    return UserRoleVisibility(
      userRoleStream: RepositoryProvider.of<AuthRepostiory>(context)
          .currentUserRulesStream(),
      dieterWidget: isUserHasProfile
          ? BlocSelector<SelectedFoodsListCubit, SelectedFoodsListState,
              DayActivityLevel>(
              selector: (state) {
                return state.dayActivityLevel;
              },
              builder: (context, dayActivityLevel) {
                return Column(
                  children: [
                    if (dayActivityLevel.isRest)
                      const NutritionDescriptionRestDay(),
                    if (dayActivityLevel.isModerate) ...[
                      const NutritionDescriptionExcerciseDayProtein(),
                      const NutritionDescriptionExcerciseDayCarbohydrate(),
                      const NutritionDescriptionExcerciseDayHydration()
                    ]
                  ],
                );
              },
            )
          : null,
    );
  }
}
