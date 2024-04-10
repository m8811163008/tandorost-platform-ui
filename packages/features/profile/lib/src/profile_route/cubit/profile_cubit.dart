import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_repository/food_repository.dart';
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
      emit(state.copyWith(
        lastUpdatedProfileCM: event,
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

  late StreamSubscription<ProfileCM> _profileStreamSubscription;
  @override
  Future<void> close() {
    _profileStreamSubscription.cancel();
    return super.close();
  }
}
