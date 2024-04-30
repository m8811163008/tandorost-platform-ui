import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.authRepostiory}) : super(const SplashState()) {
    _initialize();
  }

  void _initialize() async {
    _userRuleSubscription =
        authRepostiory.currentUserRulesStream().listen((event) {
      if (isClosed) return;
      emit(state.copyWith(userRules: event));
    }, onError: (error) {
      if (error is UserNotLogedInException) {
        emit(state.copyWith(exception: 'شما وارد کافه بازار نشده اید'));
      }
    });

    // get user subscr
    // check if bazar install
    // chcek if it has active account
  }

  @override
  Future<void> close() {
    _userRuleSubscription.cancel();
    return super.close();
  }

  late final StreamSubscription<Set<UserRule>> _userRuleSubscription;

  final AuthRepostiory authRepostiory;
}
