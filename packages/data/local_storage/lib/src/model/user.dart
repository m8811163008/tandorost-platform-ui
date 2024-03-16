import 'package:isar/isar.dart';
import 'package:local_storage/local_storage.dart';

part 'user.g.dart';

@collection
class UserCM {
  Id id = 0;

  List<SelectedFoodCM> selectedFoods = List.empty(growable: true);
}

@embedded
class SelectedFoodCM {
  late String name;
  int? calorie;
  int? gramsPerUnit;
  MacroNutritionCM? macroNutrition;

  /// Utc time
  late DateTime selectedDate;

  /// exposes howManyGrams per unit of measurment
  late UnitOfMeasurmentCM unitOfMeasurment;

  /// shows number of units of measurement selected
  late int numberOfUnits;
}
