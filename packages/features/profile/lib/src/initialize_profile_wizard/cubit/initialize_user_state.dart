part of 'initialize_user_cubit.dart';

@immutable
class InitializeUserState {
  final int currentPage;
  final ProfileCM createdProfileCM;
  final ProcessAsyncStatus formSubmitStatus;

  final BodyCompositionValues bodyCompositionValues;
  final bool isAgreementAccepted;

  InitializeUserState copyWith({
    ProcessAsyncStatus? loginStatus,
    ProcessAsyncStatus? resettingStatus,
    int? currentPage,
    ProfileCM? wizardUpdatedProfileCM,
    ProfileCM? lastUpdatedProfileCM,
    bool? isFormValid,
    ProcessAsyncStatus? formSubmitStatus,
    BodyCompositionValues? bodyCompositionValues,
    BodyCompositionCM? bodyCompositionCM,
    bool? isAgreementAccepted,
    bool? isShowWizard,
  }) =>
      InitializeUserState(
        currentPage: currentPage ?? this.currentPage,
        profileCM: wizardUpdatedProfileCM ?? createdProfileCM,
        formSubmitStatus: formSubmitStatus ?? this.formSubmitStatus,
        bodyCompositionValues:
            bodyCompositionValues ?? this.bodyCompositionValues,
        isAgreementAccepted: isAgreementAccepted ?? this.isAgreementAccepted,
      );
  bool get isValidActivatePremiumForm =>
      createdProfileCM.birthday != null &&
      createdProfileCM.birthdayShamsi != null &&
      createdProfileCM.isMale != null &&
      createdProfileCM.userName.isNotEmpty &&
      bodyCompositionValues.height != null &&
      bodyCompositionValues.weight != null &&
      isAgreementAccepted;

  InitializeUserState({
    this.currentPage = 0,
    ProfileCM? profileCM,
    this.formSubmitStatus = ProcessAsyncStatus.initial,
    this.bodyCompositionValues =
        const BodyCompositionValues(activityLevel: ActivityLevelCM.fairyActive),
    this.isAgreementAccepted = false,
  }) : createdProfileCM = profileCM ?? const ProfileCM.empty();
}
