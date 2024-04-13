import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

import 'package:food_selection/food_selection.dart';

class FoodSelectionRoute extends StatelessWidget {
  const FoodSelectionRoute({
    super.key,
  });
  static final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      bodyPadding: EdgeInsets.zero,
      actions: const [
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
          const SearchedFoodsListBuilder(),
          // if (MediaQuery.of(context).viewInsets.bottom == 0.0) Spacer(),
          // if (value) Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.sizesExtenstion.medium,
                  vertical: context.sizesExtenstion.small),
              child: const SearchFieldTextField(),
            ),
          ),
          // if (value) Spacer(),
          // if (MediaQuery.of(context).viewInsets.bottom == 0.0) Spacer(),
        ],
      ),
    );
  }
}
