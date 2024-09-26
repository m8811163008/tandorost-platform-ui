// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vo2max_calculator_cubit.dart';

class Vo2maxCalculatorState {
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
