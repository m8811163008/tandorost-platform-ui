import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class SearchFoodList extends StatelessWidget {
  const SearchFoodList(
      {super.key,
      this.foods = const [],
      this.onTap,
      this.searchedTerm,
      this.onTapAddNew});
  final List<FoodCM> foods;
  final ValueSetter<FoodCM>? onTap;
  final VoidCallback? onTapAddNew;
  final String? searchedTerm;

  @override
  Widget build(BuildContext context) {
    if (searchedTerm == '') {
      return const SizedBox.shrink();
    }
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: foods.length + 1,
      itemBuilder: (context, index) {
        late Widget foodButton;
        if (index == foods.length) {
          foodButton = AddFoodButton(
            onTap: onTapAddNew,
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
