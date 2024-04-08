import 'package:domain_model/domain_model.dart';
import 'package:equatable/equatable.dart';

class UnitOfMeasurement extends Equatable {
  final IoniconsData icon;
  final int? howManyGrams;
  final int? max;
  final UnitOfMeasurementType title;

  const UnitOfMeasurement({
    required this.title,
    required this.icon,
    this.howManyGrams,
    this.max,
  });

  static UnitOfMeasurement empty() => UnitOfMeasurement(
        title: UnitOfMeasurementType.grams,
        icon: Ionicons.ellipse_outline,
      );

  //copy with
  UnitOfMeasurement copyWith({
    IoniconsData? icon,
    int? howManyGrams,
    int? max,
    UnitOfMeasurementType? title,
  }) {
    return UnitOfMeasurement(
      icon: icon ?? this.icon,
      howManyGrams: howManyGrams ?? this.howManyGrams,
      max: max ?? this.max,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [title];
}

enum UnitOfMeasurementType { grams, tableSpoon, calorie, gramsPerUnit }
