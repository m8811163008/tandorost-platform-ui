import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

/// Used to stor all values then after aggregation use same dateTime instance to store.
class BodyCompositionValues {
  const BodyCompositionValues({
    this.height,
    this.weight,
    this.waistCircumference,
    this.armCircumference,
    this.chestCircumference,
    this.thightCircumference,
    this.calfMuscleCircumference,
    this.startBodycompositionChanging,
    this.activityLevel,
    this.hipCircumference,
  });

  // BodyCompositionCM toBodyCompositionCM() {
  //   final logDate = DateTime.now();

  //   final bodyCompositionCM = BodyCompositionCM.empty();

  //       if (startBodycompositionChanging != null) {
  //     bodyCompositionCM.startBodycompositionChanging =
  //         ;
  //   }

  //   if (armCircumference != null) {
  //     bodyCompositionCM.armCircumference = [
  //       BioDataCM(logDate: logDate, value: int.parse(armCircumference!))
  //     ];
  //   }
  //   if (height != null) {
  //     bodyCompositionCM.height = [
  //       BioDataCM()
  //         ..logDate = logDate
  //         ..value = height!
  //     ];
  //   }
  //   if (weight != null) {
  //     bodyCompositionCM.weight = [
  //       BioDataCM()
  //         ..logDate = logDate
  //         ..value = weight!
  //     ];
  //   }
  //   if (waistCircumference != null) {
  //     bodyCompositionCM.waistCircumference = [
  //       BioDataCM()
  //         ..logDate = logDate
  //         ..value = waistCircumference!
  //     ];
  //   }
  //   if (armCircumference != null) {
  //     bodyCompositionCM.armCircumference = [
  //       BioDataCM()
  //         ..logDate = logDate
  //         ..value = int.parse(armCircumference!)
  //     ];
  //   }

  //   if (chestCircumference != null) {
  //     bodyCompositionCM.chestCircumference = [
  //       BioDataCM()
  //         ..logDate = logDate
  //         ..value = int.parse(chestCircumference!)
  //     ];
  //   }
  //   if (thightCircumference != null) {
  //     bodyCompositionCM.thightCircumference = [
  //       BioDataCM()
  //         ..logDate = logDate
  //         ..value = int.parse(thightCircumference!)
  //     ];
  //   }
  //   if (calfMuscleCircumference != null) {
  //     bodyCompositionCM.calfMuscleCircumference = [
  //       BioDataCM()
  //         ..logDate = logDate
  //         ..value = int.parse(calfMuscleCircumference!)
  //     ];
  //   }
  //   if (hipCircumference != null) {
  //     bodyCompositionCM.hipCircumference = [
  //       BioDataCM()
  //         ..logDate = logDate
  //         ..value = int.parse(hipCircumference!)
  //     ];
  //   }

  //   if (activityLevel != null) {
  //     bodyCompositionCM.activityLevel = [
  //       ActivityLevelCMData()
  //         ..logDate = logDate
  //         ..value = activityLevel!
  //     ];
  //   }

  //   return bodyCompositionCM;
  // }

  final int? height;
  final double? weight;
  final int? waistCircumference;
  final String? hipCircumference;
  final String? armCircumference;
  final String? chestCircumference;
  final String? thightCircumference;
  final String? calfMuscleCircumference;
  final DateTime? startBodycompositionChanging;
  final ActivityLevelCM? activityLevel;

  BodyCompositionValues copyWith({
    ValueGetter<int?>? height,
    ValueGetter<double?>? weight,
    ValueGetter<int?>? waistCircumference,
    ValueGetter<String?>? armCircumference,
    ValueGetter<String?>? hipCircumference,
    ValueGetter<String?>? chestCircumference,
    ValueGetter<String?>? thightCircumference,
    ValueGetter<String?>? calfMuscleCircumference,
    ValueGetter<DateTime?>? startBodycompositionChanging,
    ValueGetter<ActivityLevelCM?>? activityLevel,
  }) {
    return BodyCompositionValues(
        height: height != null ? height() : this.height,
        weight: weight != null ? weight() : this.weight,
        waistCircumference: waistCircumference != null
            ? waistCircumference()
            : this.waistCircumference,
        armCircumference: armCircumference != null
            ? armCircumference()
            : this.armCircumference,
        chestCircumference: chestCircumference != null
            ? chestCircumference()
            : this.chestCircumference,
        thightCircumference: thightCircumference != null
            ? thightCircumference()
            : this.thightCircumference,
        hipCircumference: hipCircumference != null
            ? hipCircumference()
            : this.hipCircumference,
        startBodycompositionChanging: startBodycompositionChanging != null
            ? startBodycompositionChanging()
            : this.startBodycompositionChanging,
        activityLevel:
            activityLevel != null ? activityLevel() : this.activityLevel,
        calfMuscleCircumference: calfMuscleCircumference != null
            ? calfMuscleCircumference()
            : this.calfMuscleCircumference);
  }
}
