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
              child: UnitOfMusurementList(
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
            flex: 2,
            child: ScrollableNumberInput(),
          ),
          Divider(
            height: context.sizesExtenstion.small,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                  width: double.infinity, child: Text('کی خوردید؟ 2 ساعت پیش')),
              ScrollableNumberInput(
                axis: Axis.horizontal,
                itemExtends: 40,
              ),
            ],
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
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('ذخیره و غذای بعد'))),
                  SizedBox(
                    width: context.sizesExtenstion.medium,
                  ),
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('ذخیره و تاریخچه'))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
