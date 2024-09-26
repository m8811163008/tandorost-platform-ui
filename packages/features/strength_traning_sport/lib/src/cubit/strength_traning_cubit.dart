import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:domain_model/domain_model.dart';

part 'strength_traning_state.dart';

class StrengthTraningCubit extends Cubit<StrengthTraningState> {
  StrengthTraningCubit({required AuthRepostiory authRepostiory})
      : _authRepostiory = authRepostiory,
        super(StrengthTraningState());
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
