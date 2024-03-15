import 'package:isar/isar.dart';
import 'package:local_storage/local_storage.dart';

part 'food.g.dart';

@collection
class FoodCM {
  Id id = Isar.autoIncrement;
  late FoodDataCM foodDataCM;

  FoodCM();
}

@embedded
class FoodDataCM {
  late String name;
  int? calorie;
}

@embedded
class SelectedFoodCM {
  late DateTime selectedDate;
  late FoodDataCM food;

  /// exposes howManyGrams per unit of measurment
  late UnitOfMeasurmentCM unitOfMeasurment;

  /// shows number of units of measurement selected
  late int numberOfUnits;
}
