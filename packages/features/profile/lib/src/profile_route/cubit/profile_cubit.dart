import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_repository/food_repository.dart';
import 'package:profile/src/profile_route/model/chart_type.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userRepostiory, this.foodRepostiory, this.authRepostiory)
      : super(const ProfileState()) {
    _initializeProfileCm();
    _initializeDietInfoCm();
  }

  final UserRepostiory userRepostiory;
  final FoodRepostiory foodRepostiory;
  final AuthRepostiory authRepostiory;

  void _initializeDietInfoCm() {
    _dietInfoSubscription = userRepostiory.dietInfo.listen((event) {
      emit(state.copyWith(
        dietInfo: event,
      ));
    });
  }

  void _initializeProfileCm() {
    _profileStreamSubscription = userRepostiory.userProfile.listen((event) {
      Set<DomainChartType> supportedCharts = {};
      if (event.bodyComposition.weight.isNotEmpty) {
        supportedCharts.add(DomainChartType.weight);
      }

      if (event.bodyComposition.activityLevel.isNotEmpty) {
        supportedCharts.add(DomainChartType.activityLevel);
      }
      if (event.bodyComposition.armCircumference.isNotEmpty) {
        supportedCharts.add(DomainChartType.armCircumference);
      }
      if (event.bodyComposition.calfMuscleCircumference.isNotEmpty) {
        supportedCharts.add(DomainChartType.calfMuscleCircumference);
      }
      if (event.bodyComposition.chestCircumference.isNotEmpty) {
        supportedCharts.add(DomainChartType.chestCircumference);
      }
      if (event.bodyComposition.hipCircumference.isNotEmpty) {
        supportedCharts.add(DomainChartType.hipCircumference);
      }
      if (event.bodyComposition.thightCircumference.isNotEmpty) {
        supportedCharts.add(DomainChartType.thightCircumference);
      }
      if (event.bodyComposition.waistCircumference.isNotEmpty) {
        supportedCharts.add(DomainChartType.waistCircumference);
      }

      emit(state.copyWith(
        profile: event,
        supportedChartType: supportedCharts,
      ));
      calculateBodyCompositionValidation();
    });
  }

  void resetCollections() async {
    emit(state.copyWith(resettingStatus: ProcessAsyncStatus.loading));
    try {
      await Future.wait([
        userRepostiory.clearCollections(),
        foodRepostiory.clearCollections(),
      ]);
      emit(state.copyWith(resettingStatus: ProcessAsyncStatus.success));
    } catch (e) {
      emit(state.copyWith(resettingStatus: ProcessAsyncStatus.error));
    }
  }

  void updateChartType(DomainChartType domainChartType) {
    emit(state.copyWith(chartType: domainChartType));
  }

  void updateChangeWeightSpeed(ChangeWeightSpeed changeWeightSpeed) async {
    emit(state.copyWith(
      changeWeightSpeedStatus: ProcessAsyncStatus.loading,
    ));
    final setting =
        state.profile.settingCM.copyWith(changeWeightSpeed: changeWeightSpeed);
    ProfileCM profileCM = state.profile.copyWith(
      settingCM: setting,
    );
    try {
      await userRepostiory.updateProfile(profileCM);
      emit(
        state.copyWith(
          changeWeightSpeedStatus: ProcessAsyncStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          changeWeightSpeedStatus: ProcessAsyncStatus.error,
        ),
      );
    }
  }

  late StreamSubscription<ProfileCM> _profileStreamSubscription;
  late StreamSubscription<DietInfo> _dietInfoSubscription;
  @override
  Future<void> close() {
    _profileStreamSubscription.cancel();
    _dietInfoSubscription.cancel();
    return super.close();
  }

  bool get isWeightChangeSafe {
    if (state.profile.bodyComposition.weight.length <= 1) return true;
    final length = state.profile.bodyComposition.weight.length;
    final secondLastWeight = state.profile.bodyComposition.weight[length - 2];
    final lastWeight = state.profile.bodyComposition.weight[length - 1];
    //if passsed 7 days
    const weekhours = 7 * 24;
    final diffhourBetweenWeights =
        lastWeight.logDate.difference(secondLastWeight.logDate).inHours;
    // if lastWeight is less than secondLastWeight and lastWeight is less than (secondLastWeight - 0.007 * secondLastWeight)
    return lastWeight.value >=
        (secondLastWeight.value *
            (1 - (0.007 * (diffhourBetweenWeights / weekhours))));
  }

  void calculateBodyCompositionValidation() {
    Set<BodyCompositionError> errors = {
      if (!isWeightChangeSafe) BodyCompositionError.weightChange,
      // if (!isWaistCircumferenceToHeightRatioSafe)
      if (!state.dietInfo.isWaistCircumferenceToHeightRatioSafe)
        BodyCompositionError
            .waistCircumfrenceToHeightRatioIsGreaterThanZeroPointFive,
      if (!state.dietInfo.isWaistCircumferenceSafeRange)
        BodyCompositionError.waistCircumfrenceIsGratherThan94or80,
    };
    emit(state.copyWith(bodyCompositionErrors: errors));
  }
}
