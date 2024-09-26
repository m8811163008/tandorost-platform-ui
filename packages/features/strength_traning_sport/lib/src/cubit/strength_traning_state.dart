part of 'strength_traning_cubit.dart';

class StrengthTraningState {
  final ProcessAsyncStatus puchaseSubscriptionStatus;

  Vo2maxCalculatorState({
    this.puchaseSubscriptionStatus = ProcessAsyncStatus.initial,
  });

  Vo2maxCalculatorState copyWith({
    ProcessAsyncStatus? puchaseSubscriptionStatus,
  }) {
    return Vo2maxCalculatorState(
      puchaseSubscriptionStatus:
          puchaseSubscriptionStatus ?? this.puchaseSubscriptionStatus,
    );
  }
}
