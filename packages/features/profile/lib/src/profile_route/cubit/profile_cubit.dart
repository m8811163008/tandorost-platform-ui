import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_repository/food_repository.dart';
import 'package:profile/src/profile_route/model/chart_type.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userRepostiory, this.foodRepostiory)
      : super(const ProfileState()) {
    _initializeProfileCm();
  }

  final UserRepostiory userRepostiory;
  final FoodRepostiory foodRepostiory;

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
  @override
  Future<void> close() {
    _profileStreamSubscription.cancel();
    return super.close();
  }
}
