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
      ..profileCM = profileCM ?? this.profileCM;
  }
}

@embedded
class SelectedFoodCM {
  int? foodId;

  // for reference
  String? unitOfMeasurmentCMTitle;
  int? numberOfUnitOfMeasurement;

  /// Shows number of units of measurement selected

  DateTime? selectedDate;

  /// Total weight of selected Food
  int? totalWeight;

  /// Shows number of units of measurement selected
  /// It is calculated by unitOfMeasurmentCMTitle and
  /// numberOfUnitOfMeasurement.
  int? numberOfUnits;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectedFoodCM && other.selectedDate == selectedDate;
  }

  @override
  int get hashCode => selectedDate.hashCode;
  SelectedFoodCM copyWith({
    String? unitOfMeasurmentCMTitle,
    int? numberOfUnitOfMeasurement,
    DateTime? selectedDate,
    int? totalWeight,
    int? numberOfUnits,
    int? foodId,
  }) {
    return SelectedFoodCM()
      ..unitOfMeasurmentCMTitle =
          unitOfMeasurmentCMTitle ?? this.unitOfMeasurmentCMTitle
      ..numberOfUnitOfMeasurement =
          numberOfUnitOfMeasurement ?? this.numberOfUnitOfMeasurement
      ..selectedDate = selectedDate ?? this.selectedDate
      ..totalWeight = totalWeight ?? this.totalWeight
      ..numberOfUnits = numberOfUnits ?? this.numberOfUnits
      ..foodId = foodId ?? this.foodId;
  }
}

@embedded
class ProfileCM {
  String userName = '';
  DateTime? birthday;

  /// in format of --/--/----
  String? birthdayShamsi;

  bool? isMale;

  BodyCompositionCM? bodyComposition;

  ProfileCM update(ProfileCM profileCM) {
    bodyComposition ??= BodyCompositionCM();
    return ProfileCM()
      ..userName =
          profileCM.userName.isNotEmpty ? profileCM.userName : this.userName
      ..birthday = profileCM.birthday ?? this.birthday
      ..birthdayShamsi = profileCM.birthdayShamsi ?? this.birthdayShamsi
      ..isMale = profileCM.isMale ?? this.isMale
      ..bodyComposition = this.bodyComposition!.update(
            profileCM.bodyComposition ?? BodyCompositionCM(),
          );
  }
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
  List<BioDataCM> hipCircumference = const [];
  List<ActivityLevelCMData> activityLevel = const [];
  DateTime? startBodycompositionChanging;

  BodyCompositionCM update(BodyCompositionCM bodyCompositionCM) {
    return BodyCompositionCM()
      ..weight = bodyCompositionCM.weight.isNotEmpty
          ? bodyCompositionCM.weight
          : this.weight
      ..waistCircumference = bodyCompositionCM.waistCircumference.isNotEmpty
          ? bodyCompositionCM.waistCircumference
          : this.waistCircumference
      ..thightCircumference = bodyCompositionCM.thightCircumference.isNotEmpty
          ? bodyCompositionCM.thightCircumference
          : this.thightCircumference
      ..hipCircumference = bodyCompositionCM.hipCircumference.isNotEmpty
          ? bodyCompositionCM.hipCircumference
          : this.hipCircumference
      ..height = bodyCompositionCM.height.isNotEmpty
          ? bodyCompositionCM.height
          : this.height
      ..chestCircumference = bodyCompositionCM.chestCircumference.isNotEmpty
          ? bodyCompositionCM.chestCircumference
          : this.chestCircumference
      ..calfMuscleCircumference =
          bodyCompositionCM.calfMuscleCircumference.isNotEmpty
              ? bodyCompositionCM.calfMuscleCircumference
              : this.calfMuscleCircumference
      ..armCircumference = bodyCompositionCM.armCircumference.isNotEmpty
          ? bodyCompositionCM.armCircumference
          : this.armCircumference
      ..activityLevel = bodyCompositionCM.activityLevel.isNotEmpty
          ? bodyCompositionCM.activityLevel
          : this.activityLevel
      ..startBodycompositionChanging =
          bodyCompositionCM.startBodycompositionChanging ??
              this.startBodycompositionChanging;
  }
}

@embedded
class BioDataCM {
  DateTime? logDate;
  int? value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectedFoodCM && other.selectedDate == logDate;
  }

  @override
  int get hashCode => logDate.hashCode;
}

@embedded
class ActivityLevelCMData {
  DateTime? logDate;
  @Enumerated(EnumType.name)
  ActivityLevelCM? value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectedFoodCM && other.selectedDate == logDate;
  }

  @override
  int get hashCode => logDate.hashCode;
}
