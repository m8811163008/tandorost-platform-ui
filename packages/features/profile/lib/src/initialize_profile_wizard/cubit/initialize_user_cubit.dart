import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:profile/src/mapper/domain_to_cache.dart';

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
          weight: () => value.toDouble(),
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
        bodyComposition:
            lastProfile.bodyComposition.merge(state.bodyCompositionValues),
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
}
