import 'package:domain_model/domain_model.dart';
import 'package:equatable/equatable.dart';

class UnitOfMeasurement extends Equatable {
  final String title;
  final IoniconsData icon;
  final double? howManyGrams;

  const UnitOfMeasurement({
    required this.title,
    required this.icon,
    this.howManyGrams,
  });

  static UnitOfMeasurement get empty =>
      UnitOfMeasurement(title: 'empty', icon: Ionicons.ellipse_outline);

  @override
  List<Object?> get props => [title, icon, howManyGrams];
}
