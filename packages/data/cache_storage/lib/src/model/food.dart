import 'package:isar/isar.dart';

part 'food.g.dart';

class FoodCM {
  late String name;
  int? calorie;
}

@embedded
class FoodStaticticsCM extends FoodCM {}

@embedded
class SelectedFoodCM extends FoodCM {
  late DateTime selectedDate;
}
