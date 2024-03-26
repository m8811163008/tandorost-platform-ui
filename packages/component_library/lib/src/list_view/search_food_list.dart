import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class SearchFoodList extends StatelessWidget {
  const SearchFoodList({super.key, this.foods = const [], this.onTap});
  final List<Food> foods;
  final ValueSetter<Food>? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return FoodButton(
          food: foods[index],
          onTap: () {
            onTap?.call(foods[index]);
          },
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: context.sizesExtenstion.small);
      },
    );
  }
}
