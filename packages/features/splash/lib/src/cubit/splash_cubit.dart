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
    _userRuleSubscription = authRepostiory.currentUserRulesStream().listen(
      (event) {
        emit(state.copyWith(userRules: event));
      },
    );

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
