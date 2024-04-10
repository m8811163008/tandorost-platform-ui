import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';

import 'package:user_repository/user_repository.dart';

part 'initialize_user_state.dart';

class InitializeUserCubit extends Cubit<InitializeUserState> {
  InitializeUserCubit(this.userRepostiory) : super(InitializeUserState());
  final UserRepostiory userRepostiory;
  void updateBirthDay(DateTime birthday, String birthdayShamsi) {
    emit(
      state.copyWith(
        wizardUpdatedProfileCM: state.createdProfileCM.copyWith(
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
        wizardUpdatedProfileCM:
            state.createdProfileCM.copyWith(userName: userName),
      ),
    );
  }

  void updateIsMale(bool isMale) {
    emit(
      state.copyWith(
        wizardUpdatedProfileCM: state.createdProfileCM.copyWith(isMale: isMale),
      ),
    );
  }

  void upsertHeight(int value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          height: () => value,
        ),
      ),
    );
  }

  void upsertWeight(int value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          weight: () => value,
        ),
      ),
    );
  }

  void upsertWaistCircumference(int value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          waistCircumference: () => value,
        ),
      ),
    );
  }

  void toggleIsAgreementAccepted() {
    emit(
      state.copyWith(
        isAgreementAccepted: !state.isAgreementAccepted,
      ),
    );
  }

  void upsertArmCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          armCircumference: () => value,
        ),
      ),
    );
  }

  void upsertStartBodycompositionChanging(DateTime value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          startBodycompositionChanging: () => value,
        ),
      ),
    );
  }

  void upsertActivityLevelChanging(ActivityLevelCM value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          activityLevel: () => value,
        ),
      ),
    );
  }

  void upsertChestCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          chestCircumference: () => value,
        ),
      ),
    );
  }

  void upsertThightCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          thightCircumference: () => value,
        ),
      ),
    );
  }

  void upsertHipCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          hipCircumference: () => value,
        ),
      ),
    );
  }

  void upsertCalfMuscleCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
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
    final lastProfile = await userRepostiory.userProfile.first;
    assert(lastProfile == ProfileCM.empty());
    if (state.isValidActivatePremiumForm) {
      emit(state.copyWith(
        formSubmitStatus: ProcessAsyncStatus.loading,
      ));

      final updatedProfile = lastProfile.copyWith(
        bodyComposition: _calculateBodyComposition(),
        userName: state.createdProfileCM.userName,
        birthday: state.createdProfileCM.birthday,
        birthdayShamsi: state.createdProfileCM.birthdayShamsi,
        isMale: state.createdProfileCM.isMale,
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

  BodyCompositionCM _calculateBodyComposition() {
    final logDate = DateTime.now();
    BodyCompositionCM bodyCompositionCM = BodyCompositionCM.empty();
    final height = state.bodyCompositionValues.height;
    if (height != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: height,
      );
      bodyCompositionCM = bodyCompositionCM.copyWith(height: [bioData]);
    }
    final weight = state.bodyCompositionValues.weight;
    if (weight != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: weight,
      );
      bodyCompositionCM = bodyCompositionCM.copyWith(weight: [bioData]);
    }
    final armCircumference = state.bodyCompositionValues.armCircumference;
    if (armCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(armCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(armCircumference: [bioData]);
    }
    final calfMuscleCircumference =
        state.bodyCompositionValues.calfMuscleCircumference;
    if (calfMuscleCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(calfMuscleCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(calfMuscleCircumference: [bioData]);
    }
    final chestCircumference = state.bodyCompositionValues.chestCircumference;
    if (chestCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(chestCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(chestCircumference: [bioData]);
    }
    final hipCircumference = state.bodyCompositionValues.hipCircumference;
    if (hipCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(hipCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(hipCircumference: [bioData]);
    }
    final thightCircumference = state.bodyCompositionValues.thightCircumference;
    if (thightCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: int.parse(thightCircumference),
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(thightCircumference: [bioData]);
    }
    final waistCircumference = state.bodyCompositionValues.waistCircumference;
    if (waistCircumference != null) {
      final bioData = BioDataCM(
        logDate: logDate,
        value: waistCircumference,
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(waistCircumference: [bioData]);
    }
    final activityLevel = state.bodyCompositionValues.activityLevel;
    if (activityLevel != null) {
      final activityData = ActivityLevelCMData(
        logDate: logDate,
        value: activityLevel,
      );
      bodyCompositionCM =
          bodyCompositionCM.copyWith(activityLevel: [activityData]);
    }
    final startBodycompositionChanging =
        state.bodyCompositionValues.startBodycompositionChanging;
    if (startBodycompositionChanging != null) {
      bodyCompositionCM = bodyCompositionCM.copyWith(
          startBodycompositionChanging: startBodycompositionChanging);
    }
    return bodyCompositionCM;
  }
}
