// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

@immutable
class ProfileState {
  final ProcessAsyncStatus resettingStatus;
  final ProcessAsyncStatus changeWeightSpeedStatus;

  final ProfileCM profile;
  final DomainChartType chartType;

  final Set<DomainChartType> supportedChartType;
  final Set<BodyCompositionError> bodyCompositionErrors;

  const ProfileState({
    this.resettingStatus = ProcessAsyncStatus.initial,
    this.changeWeightSpeedStatus = ProcessAsyncStatus.initial,
    this.profile = const ProfileCM.empty(),
    this.chartType = DomainChartType.weight,
    this.supportedChartType = const {},
    this.bodyCompositionErrors = const {},
  });

  ProfileState copyWith({
    ProcessAsyncStatus? resettingStatus,
    ProcessAsyncStatus? changeWeightSpeedStatus,
    ProfileCM? profile,
    DomainChartType? chartType,
    Set<DomainChartType>? supportedChartType,
    Set<BodyCompositionError>? bodyCompositionErrors,
  }) {
    return ProfileState(
      resettingStatus: resettingStatus ?? this.resettingStatus,
      changeWeightSpeedStatus:
          changeWeightSpeedStatus ?? this.changeWeightSpeedStatus,
      profile: profile ?? this.profile,
      chartType: chartType ?? this.chartType,
      supportedChartType: supportedChartType ?? this.supportedChartType,
      bodyCompositionErrors:
          bodyCompositionErrors ?? this.bodyCompositionErrors,
    );
  }

  List<BioDataCM> get chartData {
    return switch (chartType) {
      DomainChartType.weight => profile.bodyComposition.weight
          .map((e) => BioDataCM(logDate: e.logDate, value: e.value.toInt()))
          .toList(),
      DomainChartType.waistCircumference =>
        profile.bodyComposition.waistCircumference,
      DomainChartType.armCircumference =>
        profile.bodyComposition.armCircumference,
      DomainChartType.chestCircumference =>
        profile.bodyComposition.chestCircumference,
      DomainChartType.thightCircumference =>
        profile.bodyComposition.thightCircumference,
      DomainChartType.calfMuscleCircumference =>
        profile.bodyComposition.calfMuscleCircumference,
      DomainChartType.hipCircumference =>
        profile.bodyComposition.hipCircumference,
      DomainChartType.activityLevel => profile.bodyComposition.activityLevel
          .map((e) => e.toBioData())
          .toList(),
    };
  }
}

extension on ActivityLevelCMData {
  BioDataCM toBioData() => BioDataCM(logDate: logDate, value: value.index);
}

enum BodyCompositionError {
  // is weight change is greather than 0.7% per week ratio
  weightChange,
  // is waist greather than 94 in men and 80 in women
  waistCircumfrenceIsGratherThan94or80,
  // is waist to height is greather than 0.5
  waistCircumfrenceToHeightRatioIsGreaterThanZeroPointFive,
}
