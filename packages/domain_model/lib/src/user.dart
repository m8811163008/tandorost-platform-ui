// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

// import 'package:domain_model/domain_model.dart';

// class User {
//   User({this.selectedFoods = const [], this.profile});

//   final int _id = 0;

//   final List<SelectedFood> selectedFoods;

//   final Profile? profile;

//   factory User.empty() {
//     return User(
//       profile: Profile.empty(),
//     );
//   }

//   User copyWith(
//       {List<SelectedFood>? selectedFoods, ValueGetter<Profile?>? profile}) {
//     return User(
//         selectedFoods: selectedFoods ?? this.selectedFoods,
//         profile: profile != null ? profile() : this.profile);
//   }
// }

// class SelectedFood {
//   SelectedFood({
//    required this.food,
//     required this.unitOfMeasurement,
//     required this.numberOfUnitOfMeasurement,
//     required this.selectedDate,
//     required this.totalWeight,
//   });

//   factory SelectedFood.empty() {
//     return SelectedFood(
//       food: Food.empty(),
//       unitOfMeasurement: UnitOfMeasurement.empty(),
//       numberOfUnitOfMeasurement: -1,
//       selectedDate: DateTime.now(),
//       totalWeight: -1,
//     );
//   }

//   final Food food;

//   // for reference
//   final UnitOfMeasurement unitOfMeasurement;

//   /// Count of numberOfUnitOfMeasurement
//   final int numberOfUnitOfMeasurement;

//   final DateTime selectedDate;

//   /// Total weight of selected Food
//   final int totalWeight;

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is SelectedFoodCM && other.selectedDate == selectedDate;
//   }

//   @override
//   int get hashCode => selectedDate.hashCode;


// }

// class BodyComposition {
//   BodyComposition(
//       {this.height = const [],
//       this.weight = const [],
//       this.waistCircumference = const [],
//       this.armCircumference = const [],
//       this.chestCircumference = const [],
//       this.thightCircumference = const [],
//       this.calfMuscleCircumference = const [],
//       this.hipCircumference = const [],
//       this.activityLevel = const [],
//       this.startBodycompositionChanging});

//   final List<BioDataCM> height;
//   final List<BioDataCM> weight;
//   final List<BioDataCM> waistCircumference;
//   final List<BioDataCM> armCircumference;
//   final List<BioDataCM> chestCircumference;
//   final List<BioDataCM> thightCircumference;
//   final List<BioDataCM> calfMuscleCircumference;
//   final List<BioDataCM> hipCircumference;
//   final List<ActivityLevelCMData> activityLevel;
//   final DateTime? startBodycompositionChanging;

//   factory BodyComposition.empty() {
//     return BodyComposition(
//       startBodycompositionChanging: DateTime.now(),
//     );
//   }
//   BodyComposition copyWith(
//       {List<BioDataCM>? height,
//       List<BioDataCM>? weight,
//       List<BioDataCM>? waistCircumference,
//       List<BioDataCM>? armCircumference,
//       List<BioDataCM>? chestCircumference,
//       List<BioDataCM>? thightCircumference,
//       List<BioDataCM>? calfMuscleCircumference,
//       List<BioDataCM>? hipCircumference,
//       List<ActivityLevelCMData>? activityLevel,
//       ValueGetter<DateTime?>? startBodycompositionChanging}) {
//     return BodyComposition(
//         height: height ?? this.height,
//         weight: weight ?? this.weight,
//         waistCircumference: waistCircumference ?? this.waistCircumference,
//         armCircumference: armCircumference ?? this.armCircumference,
//         chestCircumference: chestCircumference ?? this.chestCircumference,
//         thightCircumference: thightCircumference ?? this.thightCircumference,
//         calfMuscleCircumference:
//             calfMuscleCircumference ?? this.calfMuscleCircumference,
//         hipCircumference: hipCircumference ?? this.hipCircumference,
//         activityLevel: activityLevel ?? this.activityLevel,
//         startBodycompositionChanging: startBodycompositionChanging != null
//             ? startBodycompositionChanging()
//             : this.startBodycompositionChanging);
//   }
// }

// class BioData {
//   BioData({required this.logDate, required this.value});

//   final DateTime logDate;
//   final int value;
//   factory BioData.empty() {
//     return BioData(
//       logDate: DateTime.now(),
//       value: -1,
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is SelectedFoodCM && other.selectedDate == logDate;
//   }

//   @override
//   int get hashCode => logDate.hashCode;
//   BioData copyWith({DateTime? logDate, int? value}) {
//     return BioData(
//         logDate: logDate ?? this.logDate, value: value ?? this.value);
//   }
// }

// class ActivityLevelData {
//   ActivityLevelData({required this.logDate, required this.value});

//   final DateTime logDate;

//   final ActivityLevelCM value;

//   factory ActivityLevelData.empty() {
//     return ActivityLevelData(
//       logDate: DateTime.now(),
//       value: ActivityLevelCM.fairyActive,
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is SelectedFoodCM && other.selectedDate == logDate;
//   }

//   @override
//   int get hashCode => logDate.hashCode;
//   ActivityLevelData copyWith({DateTime? logDate, ActivityLevelCM? value}) {
//     return ActivityLevelData(
//         logDate: logDate ?? this.logDate, value: value ?? this.value);
//   }
// }
