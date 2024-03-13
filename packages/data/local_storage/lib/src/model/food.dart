import 'package:isar/isar.dart';

part 'food.g.dart';

@collection
class FoodCM {
  Id id = Isar.autoIncrement;
  late FoodDataCM foodDataCM;

  FoodCM();

  // from json
  FoodCM.fromJson(Map<String, dynamic> json)
      : foodDataCM = FoodDataCM()
          ..name = json['name'] as String
          ..calorie = json['calorie'] as int?;
}

@embedded
class FoodDataCM {
  late String name;
  int? calorie;
}
