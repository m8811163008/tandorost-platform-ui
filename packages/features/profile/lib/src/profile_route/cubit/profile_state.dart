// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

@immutable
class ProfileState {
  final ProcessAsyncStatus resettingStatus;
  final ProcessAsyncStatus changeWeightSpeedStatus;

  final ProfileCM profile;
  final DomainChartType chartType;

  final Set<DomainChartType> supportedChartType;

  List<BioDataCM> get chartData {
    return switch (chartType) {
      DomainChartType.weight => profile.bodyComposition.weight,
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

  const ProfileState({
    this.resettingStatus = ProcessAsyncStatus.initial,
    this.changeWeightSpeedStatus = ProcessAsyncStatus.initial,
    this.profile = const ProfileCM.empty(),
    this.chartType = DomainChartType.weight,
    this.supportedChartType = const {},
  });

  ProfileState copyWith({
    ProcessAsyncStatus? resettingStatus,
    ProcessAsyncStatus? changeWeightSpeedStatus,
    ProfileCM? profile,
    DomainChartType? chartType,
    Set<DomainChartType>? supportedChartType,
  }) {
    return ProfileState(
      resettingStatus: resettingStatus ?? this.resettingStatus,
      changeWeightSpeedStatus:
          changeWeightSpeedStatus ?? this.changeWeightSpeedStatus,
      profile: profile ?? this.profile,
      chartType: chartType ?? this.chartType,
      supportedChartType: supportedChartType ?? this.supportedChartType,
    );
  }
}

extension on ActivityLevelCMData {
  BioDataCM toBioData() => BioDataCM(logDate: logDate, value: value.index);
}
