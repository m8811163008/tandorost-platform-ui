import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

import 'package:food_selection/food_selection.dart';

class FoodAmountPage extends StatelessWidget {
  const FoodAmountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Flexible(
            child: SelectedFoodInfo(),
          ),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: UnitOfMeasurementAlign(),
          ),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          const Expanded(
            flex: 2,
            child: FoodAmountInputNumber(),
          ),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: FoodTimeInput(),
                ),
                Expanded(
                  child: FoodAmountInputPageBottomActions(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodTimeInput extends StatelessWidget {
  const FoodTimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FoodTimeLabel(),
        SizedBox(
          width: context.sizesExtenstion.medium,
        ),
        const Expanded(
          child: TimeScrolleInput(),
        ),
      ],
    );
  }
}
