import 'package:isar/isar.dart';

part 'food.g.dart';

@collection
class FoodCM {
  Id id = Isar.autoIncrement;
  late FoodDataCM foodDataCM;
}

@embedded
class FoodDataCM {
  late String name;
  int? calorie;
}
