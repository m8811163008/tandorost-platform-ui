part of 'profile_cubit.dart';

@immutable
class ProfileState {
  final ProcessAsyncStatus loginStatus;
  final ActivePremiumWizardState activePremiumWizardState;
  final NewMeasurementState newMeasurementState;

  final ProfileCM? lastUpdatedProfileCM;

  // final BodyCompositionValues newBodyComposition;

  ProfileState({
    this.loginStatus = ProcessAsyncStatus.initial,
    ActivePremiumWizardState? activePremiumWizardState,
    this.lastUpdatedProfileCM,
    this.newMeasurementState = const NewMeasurementState(),
  }) : activePremiumWizardState =
            activePremiumWizardState ?? ActivePremiumWizardState();

  ProfileState copyWith({
    ProcessAsyncStatus? loginStatus,
    int? currentPage,
    ProfileCM? wizardUpdatedProfileCM,
    ProfileCM? lastUpdatedProfileCM,
    bool? isFormValid,
    ProcessAsyncStatus? formSubmitStatus,
    BodyCompositionValues? bodyCompositionValues,
    BodyCompositionCM? bodyCompositionCM,
    bool? isAgreementAccepted,
    bool? isShowWizard,
    NewMeasurementState? newMeasurementState,
  }) =>
      ProfileState(
        loginStatus: loginStatus ?? this.loginStatus,
        lastUpdatedProfileCM: lastUpdatedProfileCM ?? this.lastUpdatedProfileCM,
        activePremiumWizardState: activePremiumWizardState.copyWith(
          currentPage: currentPage ?? activePremiumWizardState.currentPage,
          profileCM: wizardUpdatedProfileCM ??
              activePremiumWizardState.createdProfileCM,
          formSubmitStatus:
              formSubmitStatus ?? activePremiumWizardState.formSubmitStatus,
          bodyCompositionValues: bodyCompositionValues ??
              activePremiumWizardState.bodyCompositionValues,
          isAgreementAccepted: isAgreementAccepted ??
              activePremiumWizardState.isAgreementAccepted,
        ),
        newMeasurementState: newMeasurementState ?? this.newMeasurementState,
      );
  bool get isValidActivatePremiumForm =>
      activePremiumWizardState.createdProfileCM.birthday != null &&
      activePremiumWizardState.createdProfileCM.birthdayShamsi != null &&
      activePremiumWizardState.createdProfileCM.isMale != null &&
      activePremiumWizardState.createdProfileCM.userName.isNotEmpty &&
      activePremiumWizardState.bodyCompositionValues.height != null &&
      activePremiumWizardState.bodyCompositionValues.weight != null &&
      activePremiumWizardState.isAgreementAccepted;
}

class ActivePremiumWizardState {
  final int currentPage;
  final ProfileCM createdProfileCM;
  final ProcessAsyncStatus formSubmitStatus;

  final BodyCompositionValues bodyCompositionValues;
  final bool isAgreementAccepted;

  ActivePremiumWizardState({
    this.currentPage = 0,
    ProfileCM? profileCM,
    this.formSubmitStatus = ProcessAsyncStatus.initial,
    this.bodyCompositionValues =
        const BodyCompositionValues(activityLevel: ActivityLevelCM.fairyActive),
    this.isAgreementAccepted = false,
  }) : createdProfileCM = profileCM ?? ProfileCM.empty();

  ActivePremiumWizardState copyWith(
          {int? currentPage,
          ProfileCM? profileCM,
          bool? isFormValid,
          ProcessAsyncStatus? formSubmitStatus,
          BodyCompositionValues? bodyCompositionValues,
          bool? isAgreementAccepted}) =>
      ActivePremiumWizardState(
        currentPage: currentPage ?? this.currentPage,
        profileCM: profileCM ?? this.createdProfileCM,
        formSubmitStatus: formSubmitStatus ?? this.formSubmitStatus,
        isAgreementAccepted: isAgreementAccepted ?? this.isAgreementAccepted,
        bodyCompositionValues:
            bodyCompositionValues ?? this.bodyCompositionValues,
      );
}

class NewMeasurementState {
  final BodyCompositionValues bodyCompositionValues;
  final ProcessAsyncStatus insertStatus;

  const NewMeasurementState({
    this.bodyCompositionValues = const BodyCompositionValues(),
    this.insertStatus = ProcessAsyncStatus.initial,
  });

  NewMeasurementState copyWith(
      {ProcessAsyncStatus? insertStatus,
      ValueGetter<int?>? weight,
      ValueGetter<int?>? waistCircumference,
      ValueGetter<String?>? hipCircumference,
      ValueGetter<String?>? armCircumference,
      ValueGetter<String?>? chestCircumference,
      ValueGetter<String?>? thightCircumference,
      ValueGetter<String?>? calfMuscleCircumference,
      ValueGetter<ActivityLevelCM?>? activityLevel}) {
    return NewMeasurementState(
      insertStatus: insertStatus ?? this.insertStatus,
      bodyCompositionValues: bodyCompositionValues.copyWith(
        weight: weight,
        waistCircumference: waistCircumference,
        hipCircumference: hipCircumference,
        armCircumference: armCircumference,
        chestCircumference: chestCircumference,
        thightCircumference: thightCircumference,
        calfMuscleCircumference: calfMuscleCircumference,
        activityLevel: activityLevel,
      ),
    );
  }
}
