import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String name;
  final int? calorie;
  final DateTime? selectedDate;

  const Food({
    required this.name,
    this.calorie,
    this.selectedDate,
  });

  @override
  List<Object?> get props => [name, calorie];
}
