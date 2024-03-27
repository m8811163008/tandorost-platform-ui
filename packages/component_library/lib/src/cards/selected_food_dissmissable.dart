import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class SelectedFoodListTileDissmissable extends StatelessWidget {
  const SelectedFoodListTileDissmissable(
      {super.key, required this.selectedFood, this.onDissmiss});
  final SelectedFood selectedFood;
  final ValueSetter<SelectedFood>? onDissmiss;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          onDissmiss?.call(selectedFood);
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
          selectedFood: selectedFood,
        ),
      ),
    );
  }
}
