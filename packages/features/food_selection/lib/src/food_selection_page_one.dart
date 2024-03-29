import 'package:component_library/component_library.dart';
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
      bodyPadding: EdgeInsets.zero,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SearchedFoodsListBuilder(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.sizesExtenstion.medium),
            child: SearchFieldTextField(
              key: ValueKey('value'),
            ),
          ),
        ],
      ),
    );
  }
}
