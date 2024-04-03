import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';

import 'package:food_selection/food_selection.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      actions: [
        IconButton(
          onPressed: () {
            context.goNamed(Routes.foodSelection);
          },
          icon: Icon(Ionicons.add),
        ),
        FilterDateTimeIconButton(),
      ],
      child: SelectedFoodListBuilder(),
    );
  }
}
