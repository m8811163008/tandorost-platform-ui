import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class SearchFoodList extends StatelessWidget {
  const SearchFoodList(
      {super.key, this.foods = const [], this.onTap, this.searchedTerm});
  final List<Food> foods;
  final ValueSetter<Food>? onTap;
  final String? searchedTerm;

  @override
  Widget build(BuildContext context) {
    if (searchedTerm == '') {
      return SizedBox.shrink();
    }
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: foods.length + 1,
      itemBuilder: (context, index) {
        late Widget foodButton;
        if (index == foods.length) {
          foodButton = AddFoodButton(
            onTap: () {
              // Navigation
              context.pushNamed(Routes.foodList, extra: searchedTerm);
            },
          );
        } else {
          foodButton = FoodButton(
            food: foods[index],
            onTap: () {
              onTap?.call(foods[index]);
            },
          );
        }

        if (index == 0) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
                start: context.sizesExtenstion.medium),
            child: foodButton,
          );
        }

        return foodButton;
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: context.sizesExtenstion.small);
      },
    );
  }
}
