import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_selection/food_selection.dart';

class FoodSelectionRoute extends StatelessWidget {
  const FoodSelectionRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const FoodSelectionView();
  }
}

class FoodSelectionView extends StatelessWidget {
  const FoodSelectionView({super.key});
  static final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldKey: scaffoldKey,
      isShowDrawerButton: true,
      actions: [
        // IconButton.outlined(
        //   onPressed: () {
        //     context.pushNamed(Routes.foodSelectionList);
        //   },
        //   icon: const Icon(
        //     Ionicons.list_sharp,
        //   ),
        //   tooltip: 'لیست غذاهای صرف شده',
        // )
      ],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SearchedFoodsListBuilder(),
          SearchFieldTextField(
            key: ValueKey('value'),
          ),
        ],
      ),
    );
  }
}
