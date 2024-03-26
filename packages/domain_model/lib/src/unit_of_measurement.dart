import 'package:domain_model/domain_model.dart';
import 'package:equatable/equatable.dart';

class UnitOfMeasurement extends Equatable {
  final IoniconsData icon;
  final int? howManyGrams;
  final int? max;
  final UnitOfMeasurementType type;

  const UnitOfMeasurement({
    required this.type,
    required this.icon,
    this.howManyGrams,
    this.max,
  }) : assert(
          type == UnitOfMeasurementType.gramsPerUnit
              ? howManyGrams != null
              : true,
          'If the unit type is UnitOfMeasurementType.gramsPerUnit then howManyGrams should not be null.Try to calculate it',
        );

  static UnitOfMeasurement empty() => UnitOfMeasurement(
        type: UnitOfMeasurementType.grams,
        icon: Ionicons.ellipse_outline,
      );

  //copy with
  UnitOfMeasurement copyWith({
    IoniconsData? icon,
    int? howManyGrams,
    int? max,
    UnitOfMeasurementType? type,
  }) {
    return UnitOfMeasurement(
      icon: icon ?? this.icon,
      howManyGrams: howManyGrams ?? this.howManyGrams,
      max: max ?? this.max,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [type];
}

enum UnitOfMeasurementType { grams, tableSpoon, calorie, gramsPerUnit }
