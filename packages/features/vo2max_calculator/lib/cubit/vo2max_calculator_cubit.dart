import 'package:auth_repository/auth_repository.dart';

import 'package:domain_model/domain_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vo2max_calculator_state.dart';

class Vo2maxCalculatorCubit extends Cubit<Vo2maxCalculatorState> {
  Vo2maxCalculatorCubit({required AuthRepostiory authRepostiory})
      : _authRepostiory = authRepostiory,
        super(Vo2maxCalculatorState());
  final AuthRepostiory _authRepostiory;

  void subscribe(SubscriptionPlan subscriptionPlan) async {
    if (isClosed) return;
    emit(state.copyWith(puchaseSubscriptionStatus: ProcessAsyncStatus.loading));
    try {
      await _authRepostiory.subscribe(subscriptionPlan);
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
