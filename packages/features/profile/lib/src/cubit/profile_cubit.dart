import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authenticationRepository, this.userRepostiory)
      : super(ProfileState()) {
    _initializeProfileCm();
  }
  final AuthenticationRepository authenticationRepository;
  final UserRepostiory userRepostiory;

  void _initializeProfileCm() {
    _profileStreamSubscription = userRepostiory.userProfile.listen((event) {
      emit(state.copyWith(
        lastUpdatedProfileCM: event,
      ));
    });
  }

  late StreamSubscription<ProfileCM> _profileStreamSubscription;
  @override
  Future<void> close() {
    _profileStreamSubscription.cancel();
    return super.close();
  }

  // void login() async {
  //   emit(state.copyWith(loginStatus: ProcessAsyncStatus.loading));
  //   try {
  //     await authenticationRepository.logIn();
  //     emit(state.copyWith(loginStatus: ProcessAsyncStatus.loaded));
  //   } catch (e) {
  //     emit(state.copyWith(loginStatus: ProcessAsyncStatus.error));
  //   }
  // }

  void updateBirthDay(DateTime birthday) {
    emit(
      state.copyWith(
        wizardUpdatedProfileCM:
            state.activePremiumWizardState.createdProfileCM.copyWith(
          birthday: birthday,
        ),
      ),
    );
  }

  void updateUsername(String userName) {
    assert(userName.isNotEmpty);
    emit(
      state.copyWith(
        wizardUpdatedProfileCM: state.activePremiumWizardState.createdProfileCM
            .copyWith(userName: userName),
      ),
    );
  }

  void updateIsMale(bool isMale) {
    emit(
      state.copyWith(
        wizardUpdatedProfileCM: state.activePremiumWizardState.createdProfileCM
            .copyWith(isMale: isMale),
      ),
    );
  }

  void upsertHeight(int value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          height: () => value,
        ),
      ),
    );
  }

  void upsertWeight(int value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          weight: () => value,
        ),
      ),
    );
  }

  void upsertWaistCircumference(int value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          waistCircumference: () => value,
        ),
      ),
    );
  }

  void toggleIsAgreementAccepted() {
    emit(
      state.copyWith(
        isAgreementAccepted:
            !state.activePremiumWizardState.isAgreementAccepted,
      ),
    );
  }

  void upsertArmCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          armCircumference: () => value,
        ),
      ),
    );
  }

  void upsertStartBodycompositionChanging(DateTime value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          startBodycompositionChanging: () => value,
        ),
      ),
    );
  }

  void upsertActivityLevelChanging(ActivityLevelCM value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          activityLevel: () => value,
        ),
      ),
    );
  }

  void upsertChestCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          chestCircumference: () => value,
        ),
      ),
    );
  }

  void upsertThightCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          thightCircumference: () => value,
        ),
      ),
    );
  }

  void upsertHipCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          hipCircumference: () => value,
        ),
      ),
    );
  }

  void upsertCalfMuscleCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          calfMuscleCircumference: () => value,
        ),
      ),
    );
  }

  void updateCurrentPage(int currentPage) {
    emit(
      state.copyWith(
        currentPage: currentPage,
      ),
    );
  }

  void activePremiumWizardCreateProfile() async {
    if (state.isValidActivatePremiumForm) {
      emit(state.copyWith(
        formSubmitStatus: ProcessAsyncStatus.loading,
      ));
      state.activePremiumWizardState.createdProfileCM.bodyComposition = state
          .activePremiumWizardState.bodyCompositionValues
          .toBodyCompositionCM();
      try {
        await userRepostiory
            .updateProfile(state.activePremiumWizardState.createdProfileCM);
        emit(state.copyWith(
          formSubmitStatus: ProcessAsyncStatus.loaded,
        ));
      } catch (e) {
        emit(state.copyWith(
          formSubmitStatus: ProcessAsyncStatus.error,
        ));
      }
    }
  }

  void updateNewMesurementWeight(String value) {
    emit(
      state.copyWith(
        newMeasurementState: state.newMeasurementState.copyWith(
          weight: () => int.parse(value),
        ),
      ),
    );
  }
  void updateNewMesurementWaistCircumference(String value) {
    emit(
      state.copyWith(
        newMeasurementState: state.newMeasurementState.copyWith(
          waistCircumference: () => int.parse(value),
        ),
      ),
    );
  }
}
