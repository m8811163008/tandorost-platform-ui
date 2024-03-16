import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoodAmountPage extends StatelessWidget {
  const FoodAmountPage({super.key});
  static const String routeName = 'food-amount';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '1',
                  style: context.themeData.textTheme.displayLarge!
                      .apply(fontSizeFactor: 2),
                ),
              ),
              SizedBox(
                width: context.sizesExtenstion.medium,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'عدد',
                    style: context.themeData.textTheme.displaySmall,
                  ),
                  Text(
                    'سیب',
                    style: context.themeData.textTheme.displaySmall,
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScrollableNumberInput(),
              UnitOfMusurementList(
                list: [
                  UnitOfMeasurement(
                    title: 'گرم',
                    icon: Ionicons.ellipse_outline,
                    howManyGrams: 1,
                  ),
                  UnitOfMeasurement(
                    title: 'قاشق غذاخوری',
                    icon: Ionicons.ellipse_outline,
                    howManyGrams: 15,
                  ),
                  UnitOfMeasurement(
                    title: 'عدد متوسط',
                    icon: Ionicons.ellipse_outline,
                    howManyGrams: 15,
                  ),
                  UnitOfMeasurement(
                    title: 'کالری',
                    icon: Ionicons.ellipse_outline,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          ScrollableNumberInput(
            axis: Axis.horizontal,
            itemExtends: 40,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('غذای بعد'))),
              SizedBox(
                width: context.sizesExtenstion.medium,
              ),
              Expanded(
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('تاریخچه'))),
            ],
          ),
        ],
      ),
    );
  }
}
