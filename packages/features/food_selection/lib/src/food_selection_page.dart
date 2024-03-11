import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FoodSelectionRoute extends StatelessWidget {
  const FoodSelectionRoute({super.key});
  static const String routeName = 'food-selection';

  @override
  Widget build(BuildContext context) {
    return const FoodSelectionView();
  }
}

class FoodSelectionView extends StatelessWidget {
  const FoodSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
