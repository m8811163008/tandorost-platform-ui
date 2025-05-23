import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:profile/src/mapper/domain_to_cache.dart';

import 'package:user_repository/user_repository.dart';

part 'initialize_user_state.dart';

class InitializeUserCubit extends Cubit<InitializeUserState> {
  InitializeUserCubit(this.userRepostiory, this.authRepostiory)
      : super(const InitializeUserState()) {
    _subscription = authRepostiory.currentUserRulesStream().listen((event) {
      emit(state.copyWith(userRules: event));
    });
  }

  late final StreamSubscription<Set<UserRule>> _subscription;
  final UserRepostiory userRepostiory;
  final AuthRepostiory authRepostiory;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  void updateBirthDay(DateTime birthday, String birthdayShamsi) {
    if (isClosed) return;
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
    if (isClosed) return;
    emit(
      state.copyWith(
        wizardUpdatedProfileCM:
            state.createdProfileCM.copyWith(userName: userName),
      ),
    );
  }

  void updateIsMale(bool isMale) {
    if (isClosed) return;
    emit(
      state.copyWith(
        wizardUpdatedProfileCM: state.createdProfileCM.copyWith(isMale: isMale),
      ),
    );
  }

  void upsertHeight(int value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          height: () => value,
        ),
      ),
    );
  }

  void upsertWeight(int value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          weight: () => value.toDouble(),
        ),
      ),
    );
  }

  void upsertWaistCircumference(int value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          waistCircumference: () => value,
        ),
      ),
    );
  }

  void toggleIsAgreementAccepted() {
    if (isClosed) return;
    emit(
      state.copyWith(
        isAgreementAccepted: !state.isAgreementAccepted,
      ),
    );
  }

  void upsertArmCircumference(String value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          armCircumference: () => value,
        ),
      ),
    );
  }

  void upsertStartBodycompositionChanging(DateTime value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          startBodycompositionChanging: () => value,
        ),
      ),
    );
  }

  void upsertActivityLevelChanging(ActivityLevelCM value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          activityLevel: () => value,
        ),
      ),
    );
  }

  void upsertChestCircumference(String value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          chestCircumference: () => value,
        ),
      ),
    );
  }

  void upsertThightCircumference(String value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          thightCircumference: () => value,
        ),
      ),
    );
  }

  void upsertHipCircumference(String value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          hipCircumference: () => value,
        ),
      ),
    );
  }

  void upsertCalfMuscleCircumference(String value) {
    if (isClosed) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          calfMuscleCircumference: () => value,
        ),
      ),
    );
  }

  void updateCurrentPage(int currentPage) {
    if (isClosed) return;
    emit(
      state.copyWith(
        currentPage: currentPage,
      ),
    );
  }

  void activePremiumWizardCreateProfile() async {
    final lastProfile = await userRepostiory.userProfile.first;
    assert(lastProfile == const ProfileCM.empty());
    if (state.isValidActivatePremiumForm) {
      if (isClosed) return;
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

        if (isClosed) return;
        emit(state.copyWith(
          formSubmitStatus: ProcessAsyncStatus.success,
        ));
      } catch (e) {
        if (isClosed) return;
        emit(state.copyWith(
          formSubmitStatus: ProcessAsyncStatus.error,
        ));
      }
    }
  }

  void subscribe(SubscriptionPlan subscriptionPlan) async {
    if (isClosed) return;
    emit(state.copyWith(puchaseSubscriptionStatus: ProcessAsyncStatus.loading));
    try {
      await authRepostiory.subscribe(subscriptionPlan);
      if (isClosed) return;
      emit(
        state.copyWith(puchaseSubscriptionStatus: ProcessAsyncStatus.success),
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(puchaseSubscriptionStatus: ProcessAsyncStatus.error),
      );
    }
  }
}
