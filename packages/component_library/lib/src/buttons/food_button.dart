import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class FoodButton extends StatelessWidget {
  const FoodButton({super.key, required this.food, this.onTap});

  final Food food;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(context.sizesExtenstion.small),
          constraints: BoxConstraints.tight(
            Size.square(context.sizesExtenstion.xExtraLarge),
          ),
          child: Center(
            child: Text(
              food.name,
              maxLines: 3,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ),
    );
  }
}

class AddFoodButton extends StatelessWidget {
  const AddFoodButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(context.sizesExtenstion.small),
          constraints: BoxConstraints.tight(
            Size.square(context.sizesExtenstion.xExtraLarge),
          ),
          child: Center(
            child: Icon(Ionicons.add_circle_outline),
          ),
        ),
      ),
    );
  }
}
