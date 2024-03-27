import 'package:component_library/component_library.dart';

import 'package:flutter/material.dart';

import 'package:food_selection/food_selection.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      isShowDrawerButton: true,
      actions: [
        FilterDateTimeIconButton(),
      ],
      child: SelectedFoodListBuilder(),
    );
  }
}
