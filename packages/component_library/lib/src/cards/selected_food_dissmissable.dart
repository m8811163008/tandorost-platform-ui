import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class SelectedFoodListTileDissmissable extends StatelessWidget {
  const SelectedFoodListTileDissmissable({
    super.key,
    required this.food,
    this.onDissmiss,
    this.onLongPressed,
    this.onTap,
    this.isSelcted = false,
    this.isDismissActive = true,
  });
  final SelectedFoodCM food;

  final VoidCallback? onDissmiss;
  final VoidCallback? onTap;
  final VoidCallback? onLongPressed;
  final bool isSelcted;
  final bool isDismissActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Dismissible(
        key: UniqueKey(),
        direction: isDismissActive
            ? DismissDirection.startToEnd
            : DismissDirection.none,
        onDismissed: (direction) {
          onDissmiss?.call();
        },
        background: Container(
          alignment: AlignmentDirectional.centerStart,
          color: context.themeData.colorScheme.surfaceTint,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Ionicons.trash_bin),
          ),
        ),
        child: SelectedFoodListTile(
          selectedFood: food,
          onTap: onTap,
          onLongTap: onLongPressed,
          isSelected: isSelcted,
        ),
      ),
    );
  }
}
