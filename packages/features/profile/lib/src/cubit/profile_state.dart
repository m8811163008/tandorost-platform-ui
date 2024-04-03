part of 'profile_cubit.dart';

@immutable
class ProfileState {
  final ProcessAsyncStatus loginStatus;
  final ActivePremiumWizardState activePremiumWizardState;

  ProfileState(
      {this.loginStatus = ProcessAsyncStatus.initial,
      ActivePremiumWizardState? activePremiumWizardState})
      : activePremiumWizardState =
            activePremiumWizardState ?? ActivePremiumWizardState();

  ProfileState copyWith({
    ProcessAsyncStatus? loginStatus,
    int? currentPage,
    ProfileCM? profileCM,
    bool? isFormValid,
    ProcessAsyncStatus? formSubmitStatus,
    BodyCompositionValues? bodyCompositionValues,
    bool? isAgreementAccepted,
  }) =>
      ProfileState(
        loginStatus: loginStatus ?? this.loginStatus,
        activePremiumWizardState: activePremiumWizardState.copyWith(
          currentPage: currentPage ?? activePremiumWizardState.currentPage,
          profileCM: profileCM ?? activePremiumWizardState.profileCM,
          isFormValid: isFormValid ?? activePremiumWizardState.isFormValid,
          formSubmitStatus:
              formSubmitStatus ?? activePremiumWizardState.formSubmitStatus,
          bodyCompositionValues: bodyCompositionValues ??
              activePremiumWizardState.bodyCompositionValues,
          isAgreementAccepted: isAgreementAccepted ??
              activePremiumWizardState.isAgreementAccepted,
        ),
      );
}

class ActivePremiumWizardState {
  final int currentPage;
  final ProfileCM profileCM;
  final ProcessAsyncStatus formSubmitStatus;
  final bool isFormValid;
  final BodyCompositionValues bodyCompositionValues;
  final bool isAgreementAccepted;

  ActivePremiumWizardState({
    this.currentPage = 0,
    ProfileCM? profileCM,
    this.formSubmitStatus = ProcessAsyncStatus.initial,
    this.isFormValid = false,
    this.bodyCompositionValues = const BodyCompositionValues(),
    this.isAgreementAccepted = false,
  }) : profileCM = profileCM ?? ProfileCM();

  ActivePremiumWizardState copyWith(
          {int? currentPage,
          ProfileCM? profileCM,
          bool? isFormValid,
          ProcessAsyncStatus? formSubmitStatus,
          BodyCompositionValues? bodyCompositionValues,
          bool? isAgreementAccepted}) =>
      ActivePremiumWizardState(
        currentPage: currentPage ?? this.currentPage,
        profileCM: profileCM ?? this.profileCM,
        formSubmitStatus: formSubmitStatus ?? this.formSubmitStatus,
        isFormValid: isFormValid ?? this.isFormValid,
        isAgreementAccepted: isAgreementAccepted ?? this.isAgreementAccepted,
        bodyCompositionValues:
            bodyCompositionValues ?? this.bodyCompositionValues,
      );
}

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

  BodyCompositionCM toBodyCompositionCM() {
    final bodyCompositionCM = BodyCompositionCM();
    final logDate = DateTime.now();
    if (armCircumference != null) {
      bodyCompositionCM.armCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = int.parse(armCircumference!)
      ];
    }
    if (height != null) {
      bodyCompositionCM.height = [
        BioDataCM()
          ..logDate = logDate
          ..value = height!
      ];
    }
    if (weight != null) {
      bodyCompositionCM.weight = [
        BioDataCM()
          ..logDate = logDate
          ..value = weight!
      ];
    }
    if (waistCircumference != null) {
      bodyCompositionCM.waistCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = waistCircumference!
      ];
    }
    if (armCircumference != null) {
      bodyCompositionCM.armCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = int.parse(armCircumference!)
      ];
    }

    if (chestCircumference != null) {
      bodyCompositionCM.chestCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = int.parse(chestCircumference!)
      ];
    }
    if (thightCircumference != null) {
      bodyCompositionCM.thightCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = int.parse(thightCircumference!)
      ];
    }
    if (calfMuscleCircumference != null) {
      bodyCompositionCM.calfMuscleCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = int.parse(calfMuscleCircumference!)
      ];
    }
    if (hipCircumference != null) {
      bodyCompositionCM.hipCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = int.parse(hipCircumference!)
      ];
    }
    if (startBodycompositionChanging != null) {
      bodyCompositionCM.startBodycompositionChanging =
          startBodycompositionChanging;
    }
    if (activityLevel != null) {
      bodyCompositionCM.activityLevel = [
        BioDataActivityLevelCM()
          ..logDate = logDate
          ..value = activityLevel!
      ];
    }

    return bodyCompositionCM;
  }

  final int? height;
  final int? weight;
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
    ValueGetter<int?>? weight,
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
