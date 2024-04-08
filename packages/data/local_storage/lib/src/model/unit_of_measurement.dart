import 'package:isar/isar.dart';
part 'unit_of_measurement.g.dart';

/// Holds the data for unit of measurement.
@collection
class UnitOfMeasurmentCM {
  Id id = Isar.autoIncrement;
  String? title;
  String? icon;

  /// howManyGrams are in one unit of measurement
  /// in case of energy the value is null
  int? howManyGrams;

  /// specify maximum amount of the selection for UI assistance.
  int? max;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UnitOfMeasurmentCM && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
