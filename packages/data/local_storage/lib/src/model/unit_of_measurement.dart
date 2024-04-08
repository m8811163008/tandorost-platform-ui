import 'package:hive/hive.dart';

part 'unit_of_measurement.g.dart';

/// Holds the data for unit of measurement.
@HiveType(typeId: 9)
class UnitOfMeasurmentCM {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String icon;

  /// howManyGrams are in one unit of measurement
  /// in case of energy the value is null
  @HiveField(2)
  final int? howManyGrams;

  /// specify maximum amount of the selection for UI assistance.
  @HiveField(3)
  final int? max;

  factory UnitOfMeasurmentCM.empty() {
    return UnitOfMeasurmentCM(
      title: '',
      icon: '',
    );
  }

  UnitOfMeasurmentCM({
    required this.title,
    required this.icon,
    this.max,
    this.howManyGrams,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UnitOfMeasurmentCM && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
