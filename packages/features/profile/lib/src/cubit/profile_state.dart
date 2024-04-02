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
        ),
      );
}

class ActivePremiumWizardState {
  final int currentPage;
  final ProfileCM profileCM;
  final ProcessAsyncStatus formSubmitStatus;
  final bool isFormValid;
  final BodyCompositionValues bodyCompositionValues;

  ActivePremiumWizardState(
      {this.currentPage = 0,
      ProfileCM? profileCM,
      this.formSubmitStatus = ProcessAsyncStatus.initial,
      this.isFormValid = false,
      this.bodyCompositionValues = const BodyCompositionValues()})
      : profileCM = profileCM ?? ProfileCM();

  ActivePremiumWizardState copyWith(
          {int? currentPage,
          ProfileCM? profileCM,
          bool? isFormValid,
          ProcessAsyncStatus? formSubmitStatus,
          BodyCompositionValues? bodyCompositionValues}) =>
      ActivePremiumWizardState(
        currentPage: currentPage ?? this.currentPage,
        profileCM: profileCM ?? this.profileCM,
        formSubmitStatus: formSubmitStatus ?? this.formSubmitStatus,
        isFormValid: isFormValid ?? this.isFormValid,
        bodyCompositionValues:
            bodyCompositionValues ?? this.bodyCompositionValues,
      );
}

class BodyCompositionValues {
  const BodyCompositionValues(
      {this.height,
      this.weight,
      this.waistCircumference,
      this.armCircumference,
      this.chestCircumference,
      this.thightCircumference,
      this.calfMuscleCircumference});

  BodyCompositionCM toBodyCompositionCM() {
    final bodyCompositionCM = BodyCompositionCM();
    final logDate = DateTime.now();
    if (armCircumference != null) {
      bodyCompositionCM.armCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = armCircumference!
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
          ..value = armCircumference!
      ];
    }

    if (chestCircumference != null) {
      bodyCompositionCM.chestCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = chestCircumference!
      ];
    }
    if (thightCircumference != null) {
      bodyCompositionCM.thightCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = thightCircumference!
      ];
    }
    if (calfMuscleCircumference != null) {
      bodyCompositionCM.calfMuscleCircumference = [
        BioDataCM()
          ..logDate = logDate
          ..value = calfMuscleCircumference!
      ];
    }

    return bodyCompositionCM;
  }

  final int? height;
  final int? weight;
  final int? waistCircumference;
  final int? armCircumference;
  final int? chestCircumference;
  final int? thightCircumference;
  final int? calfMuscleCircumference;

  BodyCompositionValues copyWith(
      {ValueGetter<int?>? height,
      ValueGetter<int?>? weight,
      ValueGetter<int?>? waistCircumference,
      ValueGetter<int?>? armCircumference,
      ValueGetter<int?>? chestCircumference,
      ValueGetter<int?>? thightCircumference,
      ValueGetter<int?>? calfMuscleCircumference}) {
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
        calfMuscleCircumference: calfMuscleCircumference != null
            ? calfMuscleCircumference()
            : this.calfMuscleCircumference);
  }
}
