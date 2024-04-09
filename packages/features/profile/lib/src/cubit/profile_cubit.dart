import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userRepostiory) : super(ProfileState()) {
    _initializeProfileCm();
  }

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

  void updateBirthDay(DateTime birthday, String birthdayShamsi) {
    emit(
      state.copyWith(
        wizardUpdatedProfileCM:
            state.activePremiumWizardState.createdProfileCM.copyWith(
          birthday: birthday,
          birthdayShamsi: birthdayShamsi,
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
    assert(state.lastUpdatedProfileCM != null);
    if (state.isValidActivatePremiumForm) {
      emit(state.copyWith(
        formSubmitStatus: ProcessAsyncStatus.loading,
      ));

      final updatedProfile = state.lastUpdatedProfileCM!.copyWith(
        bodyComposition: _calculateBodyComposition(),
        userName: state.activePremiumWizardState.createdProfileCM.userName,
        birthday: state.activePremiumWizardState.createdProfileCM.birthday,
        birthdayShamsi:
            state.activePremiumWizardState.createdProfileCM.birthdayShamsi,
        isMale: state.activePremiumWizardState.createdProfileCM.isMale,
      );

      try {
        await userRepostiory.updateProfile(updatedProfile);
        emit(state.copyWith(
          formSubmitStatus: ProcessAsyncStatus.success,
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

  BodyCompositionCM _calculateBodyComposition() {
    final logDate = DateTime.now();
    BodyCompositionCM bodyCompositionCM = BodyCompositionCM.empty();
    final height = state.activePremiumWizardState.bodyCompositionValues.height;
    if (height != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: height,
      );
      bodyCompositionCM = bodyCompositionCM.copyWith(height: [bioData]);
    }
    final weight = state.activePremiumWizardState.bodyCompositionValues.weight;
    if (weight != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: weight,
      );
      bodyCompositionCM = bodyCompositionCM.copyWith(weight: [bioData]);
    }
    final armCircumference =
        state.activePremiumWizardState.bodyCompositionValues.armCircumference;
    if (armCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(armCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(armCircumference: [bioData]);
    }
    final calfMuscleCircumference = state
        .activePremiumWizardState.bodyCompositionValues.calfMuscleCircumference;
    if (calfMuscleCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(calfMuscleCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(calfMuscleCircumference: [bioData]);
    }
    final chestCircumference =
        state.activePremiumWizardState.bodyCompositionValues.chestCircumference;
    if (chestCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(chestCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(chestCircumference: [bioData]);
    }
    final hipCircumference =
        state.activePremiumWizardState.bodyCompositionValues.hipCircumference;
    if (hipCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(hipCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(hipCircumference: [bioData]);
    }
    final thightCircumference = state
        .activePremiumWizardState.bodyCompositionValues.thightCircumference;
    if (thightCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(thightCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(thightCircumference: [bioData]);
    }
    final waistCircumference =
        state.activePremiumWizardState.bodyCompositionValues.waistCircumference;
    if (waistCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: waistCircumference,
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(waistCircumference: [bioData]);
    }
    final activityLevel =
        state.activePremiumWizardState.bodyCompositionValues.activityLevel;
    if (activityLevel != null) {
      final activityData = ActivityLevelCMData(
        logDate: logDate,
        value: activityLevel,
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(activityLevel: [activityData]);
    }
    final startBodycompositionChanging = state.activePremiumWizardState
        .bodyCompositionValues.startBodycompositionChanging;
    if (startBodycompositionChanging != null) {
      bodyCompositionCM = bodyCompositionCM.copyWith(
          startBodycompositionChanging: startBodycompositionChanging);
    }
    return bodyCompositionCM;
  }
}
