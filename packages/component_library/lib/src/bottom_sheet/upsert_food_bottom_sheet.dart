import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class UpsertFoodBottomSheet extends StatelessWidget {
  const UpsertFoodBottomSheet(
      {super.key, this.onfoodSaved, this.onfoodUpdated});
  final ValueSetter<Food>? onfoodUpdated;
  final VoidCallback? onfoodSaved;

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
