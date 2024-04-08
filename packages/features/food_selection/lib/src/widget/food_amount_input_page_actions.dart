import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class FoodAmountInputPageBottomActions extends StatelessWidget {
  const FoodAmountInputPageBottomActions({super.key});

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
            context.showBanner(
              materialBanner: AppMaterialBanner(
                text: 'ذخیره شد',
              ),
            );
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
                  context.read<FoodSelectionBloc>()
                    ..add(const SelectedFoodSaved())
                    ..add(const SearchFoodFormReset());
                  // Navigation
                  context.pushReplacementNamed(
                    Routes.foodSelectionList,
                  );
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
                  context.read<FoodSelectionBloc>()
                    ..add(const SelectedFoodSaved())
                    ..add(const SearchFoodFormReset());
                  // Navigation
                  context.pop();
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
