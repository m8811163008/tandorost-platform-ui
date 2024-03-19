import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class FoodAmountPage extends StatelessWidget {
  const FoodAmountPage({super.key});

  static const String routeName = 'input-food-amount';

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
          UnitOfMusurementAlign(),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          Expanded(flex: 2, child: FoodAmountInputNumber()),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'کی خوردید؟',
                            style: context.themeData.textTheme.bodyMedium,
                            children: [
                              TextSpan(text: '\n'),
                              TextSpan(text: ' 2 ساعت پیش')
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.sizesExtenstion.medium,
                      ),
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              height: 35.7 * 1.68),
                          child: const ScrollableNumberInput(
                            axis: Axis.horizontal,
                            itemExtends: 35.7,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                            child: const Text('ذخیره و غذای بعد'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UnitOfMusurementAlign extends StatelessWidget {
  const UnitOfMusurementAlign({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1.3 / 3,
        height: 176,
        child: BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
          builder: (context, state) {
            return UnitOfMusurementList(
              list: context.select<FoodSelectionBloc, List<UnitOfMeasurement>>(
                (bloc) => bloc.state.unitOfMesurementList,
              ),
              onSelected: (selectedUnitOfMeasurement) {
                context.read<FoodSelectionBloc>().add(
                      SelectedFoodUpdated(
                        unitOfMeasurement: selectedUnitOfMeasurement,
                      ),
                    );
              },
            );
          },
        ),
      ),
    );
  }
}

class FoodAmountInputNumber extends StatelessWidget {
  const FoodAmountInputNumber({super.key});

  @override
  Widget build(BuildContext context) {
    const extend = 104.0;
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        width: extend * 1.68,
        height: extend * 2.5,
      ),
      child: BlocSelector<FoodSelectionBloc, FoodSelectionState,
          UnitOfMeasurement?>(
        selector: (bloc) {
          return bloc.selectedFood?.unitOfMeasurement;
        },
        builder: (context, unitOfMeasurement) {
          final max = unitOfMeasurement?.max ?? 100;
          return ScrollableNumberInput(
            key: UniqueKey(),
            min: max < 500 ? 1 : 10,
            max: max,
            itemExtends: extend,
            onSelectedNumberChanged: (value) {
              context.read<FoodSelectionBloc>().add(
                    SelectedFoodUpdated(
                      measurementUnitCount: value,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}
