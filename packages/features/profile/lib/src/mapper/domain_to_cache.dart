import 'package:domain_model/domain_model.dart';

extension BodyCompositionCMX on BodyCompositionCM {
  BodyCompositionCM merge(BodyCompositionValues bodyCompositionValues) {
    final logDate = DateTime.now();

    var composition = BodyCompositionCM(
      height: [
        ...height,
        if (bodyCompositionValues.height != null &&
            bodyCompositionValues.height! != 0)
          BioDataCM(logDate: logDate, value: bodyCompositionValues.height!)
      ],
      weight: [
        ...weight,
        if (bodyCompositionValues.weight != null &&
            bodyCompositionValues.weight! != 0)
          BioDataCM(logDate: logDate, value: bodyCompositionValues.weight!)
      ],
      waistCircumference: [
        ...waistCircumference,
        if (bodyCompositionValues.waistCircumference != null &&
            bodyCompositionValues.waistCircumference! != 0)
          BioDataCM(
              logDate: logDate,
              value: bodyCompositionValues.waistCircumference!)
      ],
      armCircumference: [
        ...armCircumference,
        if (bodyCompositionValues.armCircumference != null &&
            bodyCompositionValues.armCircumference!.isNotEmpty)
          BioDataCM(
              logDate: logDate,
              value: int.parse(bodyCompositionValues.armCircumference!))
      ],
      chestCircumference: [
        ...chestCircumference,
        if (bodyCompositionValues.chestCircumference != null &&
            bodyCompositionValues.chestCircumference!.isNotEmpty)
          BioDataCM(
              logDate: logDate,
              value: int.parse(bodyCompositionValues.chestCircumference!))
      ],
      thightCircumference: [
        ...thightCircumference,
        if (bodyCompositionValues.thightCircumference != null &&
            bodyCompositionValues.thightCircumference!.isNotEmpty)
          BioDataCM(
              logDate: logDate,
              value: int.parse(bodyCompositionValues.thightCircumference!))
      ],
      calfMuscleCircumference: [
        ...calfMuscleCircumference,
        if (bodyCompositionValues.calfMuscleCircumference != null &&
            bodyCompositionValues.calfMuscleCircumference!.isNotEmpty)
          BioDataCM(
              logDate: logDate,
              value: int.parse(bodyCompositionValues.calfMuscleCircumference!))
      ],
      hipCircumference: [
        ...hipCircumference,
        if (bodyCompositionValues.hipCircumference != null &&
            bodyCompositionValues.hipCircumference!.isNotEmpty)
          BioDataCM(
              logDate: logDate,
              value: int.parse(bodyCompositionValues.hipCircumference!))
      ],
      activityLevel: [
        ...activityLevel,
        if (bodyCompositionValues.activityLevel != null)
          ActivityLevelCMData(
              logDate: logDate, value: bodyCompositionValues.activityLevel!)
      ],
      startBodycompositionChanging:
          bodyCompositionValues.startBodycompositionChanging ??
              startBodycompositionChanging ??
              DateTime.now(),
    );
    return composition;
  }
}
