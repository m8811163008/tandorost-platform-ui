import 'package:domain_model/domain_model.dart';
import 'package:equatable/equatable.dart';

class UnitOfMeasurement extends Equatable {
  final String title;
  final IoniconsData icon;
  final int? howManyGrams;
  final int? max;

  const UnitOfMeasurement({
    required this.title,
    required this.icon,
    this.howManyGrams,
    this.max,
  });

  //copy with
  UnitOfMeasurement copyWith({
    String? title,
    IoniconsData? icon,
    int? howManyGrams,
    int? max,
  }) {
    return UnitOfMeasurement(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      howManyGrams: howManyGrams ?? this.howManyGrams,
      max: max ?? this.max,
    );
  }

  static UnitOfMeasurement get empty => UnitOfMeasurement(
        title: 'empty',
        icon: Ionicons.ellipse_outline,
      );

  @override
  List<Object?> get props => [title, icon, howManyGrams];
}
