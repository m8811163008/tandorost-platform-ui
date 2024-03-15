import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

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
                    'قاشق',
                    style: context.themeData.textTheme.displaySmall,
                  ),
                  Text(
                    'سیب',
                    style: context.themeData.textTheme.displaySmall,
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScrollableNumberInput(),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: 180,
                  width: 180,
                ),
                child: GridView.count(
                  crossAxisCount: 1,
                  children: List.generate(4, (index) => Placeholder()),
                  primary: false,
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('غذای بعد')),
              OutlinedButton(onPressed: () {}, child: Text('تاریخچه')),
            ],
          ),
        ],
      ),
    );
  }
}
