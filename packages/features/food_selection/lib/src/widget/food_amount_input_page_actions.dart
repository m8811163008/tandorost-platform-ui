import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class FoodAmountInputPageBottomActions extends StatefulWidget {
  const FoodAmountInputPageBottomActions({super.key});

  @override
  State<FoodAmountInputPageBottomActions> createState() =>
      _FoodAmountInputPageBottomActionsState();
}

class _FoodAmountInputPageBottomActionsState
    extends State<FoodAmountInputPageBottomActions> {
  String? nextDestination;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: BlocListener<FoodSelectionBloc, FoodSelectionState>(
        listenWhen: (previous, current) =>
            previous.upsertSelectedFoodStatus !=
            current.upsertSelectedFoodStatus,
        listener: (context, state) {
          if (state.upsertSelectedFoodStatus.isError) {
            context.showSnackbar(
              snackBar: const SnackBar(
                behavior: SnackBarBehavior.floating,
                showCloseIcon: true,
                content: Text('An error occurred!'),
              ),
            );
          } else if (state.upsertSelectedFoodStatus.isSuccess) {
            if (nextDestination == Routes.foodSelection) {
              context.showBanner(
                materialBanner: AppMaterialBanner(
                  text: 'ذخیره شد',
                ),
              );
            }

            context.goNamed(nextDestination!);
            context.read<FoodSelectionBloc>().add(const SearchFoodFormReset());
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  // save the food
                  context
                      .read<FoodSelectionBloc>()
                      .add(const SelectedFoodSaved());
                  nextDestination = Routes.foodSelectionList;
                },
                child: const Text('ذخیره و تاریخچه'),
              ),
            ),
            SizedBox(
              width: context.sizesExtenstion.medium,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // save the food
                  context
                      .read<FoodSelectionBloc>()
                      .add(const SelectedFoodSaved());
                  nextDestination = Routes.foodSelection;
                },
                child: const Text('ذخیره و خوراک بعد'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
