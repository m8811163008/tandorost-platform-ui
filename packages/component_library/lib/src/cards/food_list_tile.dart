import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class FoodListTile extends StatefulWidget {
  const FoodListTile({
    super.key,
    required this.food,
    this.onFoodDelete,
    this.onFoodUpdate,
  });
  final FoodCM food;
  final ValueSetter<FoodCM>? onFoodUpdate;
  final ValueSetter<FoodCM>? onFoodDelete;

  @override
  State<FoodListTile> createState() => _FoodListTileState();
}

class _FoodListTileState extends State<FoodListTile>
    with SingleTickerProviderStateMixin {
  // Method to create labels
  String _createLabel(String value, String label) {
    return '$value $label';
  }

  @override
  Widget build(BuildContext context) {
    final selectedFoodCalarieLabel = _createLabel(
        '${widget.food.calorie}', context.l10n.foodDataCalarieLabel);
    final selectedFoodFatLabel = _createLabel(
        context.l10n
            .foodDataPercentValue(widget.food.macroNutrition.fatPercent),
        context.l10n.nutritionDataFatLabel);
    final selectedFoodProteinLabel = _createLabel(
        context.l10n
            .foodDataPercentValue(widget.food.macroNutrition.proteinPercent),
        context.l10n.nutritionDataProteinLabel);
    final selectedFoodCarbohydrateLabel = _createLabel(
        context.l10n.foodDataPercentValue(
            widget.food.macroNutrition.carbohydratePercent),
        context.l10n.nutritionDataCarbohydrateLabel);

    return Card(
      child: ListTile(
        title: Text(widget.food.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  enableDrag: true,
                  showDragHandle: true,
                  isDismissible: true,
                  builder: (_) => UpsertFoodBottomSheet(
                    onfoodUpdated: widget.onFoodUpdate?.call,
                    initalFood: widget.food,
                  ),
                );
              },
              visualDensity: VisualDensity.compact,
              icon: const Icon(Ionicons.options),
            ),
            IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text('حذف غذا'),
                      content:
                          Text('آیا از حذف ${widget.food.name} اطمینان دارید؟'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('انصراف'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            widget.onFoodDelete?.call(widget.food);
                          },
                          child: const Text('حذف'),
                        ),
                      ],
                    );
                  },
                );
              },
              visualDensity: VisualDensity.compact,
              icon: const Icon(Ionicons.trash_bin),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(selectedFoodCalarieLabel),
                    const Spacer(),
                    Text(
                      selectedFoodFatLabel,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedFoodProteinLabel,
                    ),
                    const Spacer(),
                    Text(
                      selectedFoodCarbohydrateLabel,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
