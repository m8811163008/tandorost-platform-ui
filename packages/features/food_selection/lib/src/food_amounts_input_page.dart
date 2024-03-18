import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/src/bloc/food_selection_bloc.dart';
import 'package:food_selection/src/widget/widget.dart';

class FoodAmountPage extends StatelessWidget {
  const FoodAmountPage({super.key});

  static const String routeName = 'food-amount';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SelectedFoodInfo(),
          Divider(
            height: context.sizesExtenstion.small,
          ),

          /// TODO : Add a list of units of measurement and run and test
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 2 / 3,
              height: 176,
              child: const UnitOfMusurementList(
                list: [],
              ),
            ),
          ),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 60 * 1.68),
              child: const ScrollableNumberInput(),
            ),
          ),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Flexible(child: Text('کی خوردید؟ 2 ساعت پیش')),
                SizedBox(
                  width: context.sizesExtenstion.medium,
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints.tightFor(height: 35.7 * 1.68),
                    child: const ScrollableNumberInput(
                      axis: Axis.horizontal,
                      itemExtends: 35.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('ذخیره و تاریخچه'))),
                  SizedBox(
                    width: context.sizesExtenstion.medium,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('ذخیره و غذای بعد'))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
