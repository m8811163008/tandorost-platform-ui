import 'package:isar/isar.dart';
import 'package:local_storage/local_storage.dart';

part 'user.g.dart';

@collection
class UserCM {
  Id id = 0;

  List<SelectedFoodCM> selectedFoods = const [];

  UserCM copyWith({List<SelectedFoodCM>? selectedFoods}) {
    return UserCM()..selectedFoods = selectedFoods ?? this.selectedFoods;
  }
}

@embedded
class SelectedFoodCM {
  // name of the food
  late String name;
  // total calarie of food
  int? calorie;
  // how many gram in one unit of mesurment
  int? gramsPerUnit;

  // macro nutrition percent in 100 gram of the food
  MacroNutritionCM? macroNutrition;

  /// Utc time used as key
  late DateTime selectedDate;

  /// exposes howManyGrams per unit of measurment
  late UnitOfMeasurmentCM unitOfMeasurment;

  /// shows number of units of measurement selected
  late int numberOfUnits;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectedFoodCM && other.selectedDate == selectedDate;
  }

  @override
  int get hashCode => selectedDate.hashCode;
}
