import 'package:isar/isar.dart';
import 'package:local_storage/local_storage.dart';

part 'user.g.dart';

@collection
class UserCM {
  Id id = 0;

  List<SelectedFoodCM> selectedFoods = const [];

  ProfileCM profileCM = ProfileCM();

  UserCM copyWith({List<SelectedFoodCM>? selectedFoods, ProfileCM? profileCM}) {
    return UserCM()
      ..selectedFoods = selectedFoods ?? this.selectedFoods
      ..id = this.id
      ..profileCM = profileCM ?? this.profileCM;
  }
}

@embedded
class SelectedFoodCM {
  /// name of the food
  late String name;

  /// Calorie of food per 100 grams of food.
  late int calorie;

  /// gram per one unit of food for example each apple is 100 grams
  late int gramsPerUnit;

  /// Actual value of macro nutrition of the food per 100 grams.
  late MacroNutritionCM macroNutrition;

  /// Utc time used as key
  late DateTime selectedDate;

  /// Selected unit of measurement.
  ///
  ///
  /// For example each apple is 100 grams
  late UnitOfMeasurmentCM unitOfMeasurmentCM;

  /// Shows number of units of measurement selected
  late int numberOfUnits;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectedFoodCM && other.selectedDate == selectedDate;
  }

  @override
  int get hashCode => selectedDate.hashCode;
}

@embedded
class ProfileCM {
  DateTime? birthday;
  String userName = '';
  bool? isMale;
  BodyCompositionCM? bodyComposition;
}

@embedded
class BodyCompositionCM {
  List<BioDataCM> height = const [];
  List<BioDataCM> weight = const [];
  List<BioDataCM> waistCircumference = const [];
  List<BioDataCM> armCircumference = const [];
  List<BioDataCM> chestCircumference = const [];
  List<BioDataCM> thightCircumference = const [];
  List<BioDataCM> calfMuscleCircumference = const [];
  DateTime? startBodycompositionChanging;
}

@embedded
class BioDataCM {
  late DateTime logDate;
  late int value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectedFoodCM && other.selectedDate == logDate;
  }

  @override
  int get hashCode => logDate.hashCode;
}
