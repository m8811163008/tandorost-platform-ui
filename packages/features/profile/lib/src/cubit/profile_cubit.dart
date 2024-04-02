import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authenticationRepository, this.userRepostiory)
      : super(ProfileState());
  final AuthenticationRepository authenticationRepository;
  final UserRepostiory userRepostiory;

  late StreamSubscription<ProfileCM> _profileStreamSubscription;

  void login() async {
    emit(state.copyWith(loginStatus: ProcessAsyncStatus.loading));
    try {
      await authenticationRepository.logIn();
      emit(state.copyWith(loginStatus: ProcessAsyncStatus.loaded));
    } catch (e) {
      emit(state.copyWith(loginStatus: ProcessAsyncStatus.error));
    }
  }

  bool get _isValidActivatePremiumForm =>
      state.activePremiumWizardState.profileCM.isMale != null &&
      state.activePremiumWizardState.profileCM.birthday != null &&
      state.activePremiumWizardState.profileCM.userName.isNotEmpty &&
      state.activePremiumWizardState.bodyCompositionValues.height != null &&
      state.activePremiumWizardState.bodyCompositionValues.weight != null;

  void updateBirthDay(DateTime birthday) {
    emit(
      state.copyWith(
        profileCM: state.activePremiumWizardState.profileCM.copyWith(
          birthday: birthday,
        ),
        isFormValid: _isValidActivatePremiumForm,
      ),
    );
  }

  void updateUsername(String userName) {
    assert(userName.isNotEmpty);
    emit(
      state.copyWith(
        profileCM: state.activePremiumWizardState.profileCM
            .copyWith(userName: userName),
        isFormValid: _isValidActivatePremiumForm,
      ),
    );
  }

  void updateIsMale(bool isMale) {
    emit(
      state.copyWith(
        profileCM:
            state.activePremiumWizardState.profileCM.copyWith(isMale: isMale),
        isFormValid: _isValidActivatePremiumForm,
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
        isFormValid: _isValidActivatePremiumForm,
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
        isFormValid: _isValidActivatePremiumForm,
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

  void upsertArmCircumference(int value) {
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

  void upsertChestCircumference(int value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          chestCircumference: () => value,
        ),
      ),
    );
  }

  void upsertThightCircumference(int value) {
    emit(
      state.copyWith(
        bodyCompositionValues:
            state.activePremiumWizardState.bodyCompositionValues.copyWith(
          thightCircumference: () => value,
        ),
      ),
    );
  }

  void upsertCalfMuscleCircumference(int value) {
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
    if (state.activePremiumWizardState.isFormValid) {
      emit(state.copyWith(
        formSubmitStatus: ProcessAsyncStatus.loading,
      ));
      state.activePremiumWizardState.profileCM.bodyComposition = state
          .activePremiumWizardState.bodyCompositionValues
          .toBodyCompositionCM();
      try {
        await userRepostiory
            .updateProfile(state.activePremiumWizardState.profileCM);
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
}
