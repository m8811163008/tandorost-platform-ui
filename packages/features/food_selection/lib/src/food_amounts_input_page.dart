import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class FoodAmountPage extends StatelessWidget {
  const FoodAmountPage({super.key});
  static const String routeName = 'food-amount';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '1',
                  style: context.themeData.textTheme.displayLarge!
                      .apply(fontSizeFactor: 2),
                ),
                SizedBox(
                  width: context.sizesExtenstion.medium,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        'عدد',
                        style: context.themeData.textTheme.displaySmall,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'سیب',
                        style: context.themeData.textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 2 / 3,
              height: 176,
              child: const UnitOfMusurementList(
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
                  UnitOfMeasurement(
                    title: 'کالری',
                    icon: Ionicons.ellipse_outline,
                  ),
                  UnitOfMeasurement(
                    title: 'کالری',
                    icon: Ionicons.ellipse_outline,
                  ),
                ],
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
                    constraints: const BoxConstraints.tightFor(height: 35.7 * 1.68),
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
