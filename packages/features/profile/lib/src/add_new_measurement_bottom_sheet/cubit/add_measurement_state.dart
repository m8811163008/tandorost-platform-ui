// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_measurement_cubit.dart';

@immutable
class AddMeasurementState {
  final ProcessAsyncStatus formSubmitStatus;

  final BodyCompositionValues bodyCompositionValues;
  bool get isFormValid =>
      bodyCompositionValues != const BodyCompositionValues();

  const AddMeasurementState({
    this.formSubmitStatus = ProcessAsyncStatus.initial,
    this.bodyCompositionValues = const BodyCompositionValues(),
  });

  AddMeasurementState copyWith({
    ProcessAsyncStatus? formSubmitStatus,
    BodyCompositionValues? bodyCompositionValues,
  }) {
    return AddMeasurementState(
      formSubmitStatus: formSubmitStatus ?? this.formSubmitStatus,
      bodyCompositionValues:
          bodyCompositionValues ?? this.bodyCompositionValues,
    );
  }
}
