import 'package:flutter/material.dart';
import 'package:domain_model/domain_model.dart';
import 'package:equatable/equatable.dart';

class UnitOfMeasurement extends Equatable {
  final IoniconsData icon;
  final int? howManyGrams;
  final int? max;
  final UnitOfMeasurementType title;

  UnitOfMeasurement(
      {required this.icon, required this.title, this.howManyGrams, this.max});

  static UnitOfMeasurement empty() => UnitOfMeasurement(
      title: UnitOfMeasurementType.grams,
      icon: Ionicons.ellipse_outline,
      howManyGrams: -1,
      max: -1);

  //copy with

  @override
  List<Object?> get props => [title];
  UnitOfMeasurement copyWith(
      {IoniconsData? icon,
      ValueGetter<int?>? howManyGrams,
      ValueGetter<int?>? max,
      UnitOfMeasurementType? title}) {
    return UnitOfMeasurement(
        icon: icon ?? this.icon,
        howManyGrams: howManyGrams != null ? howManyGrams() : this.howManyGrams,
        max: max != null ? max() : this.max,
        title: title ?? this.title);
  }
}

enum UnitOfMeasurementType { grams, tableSpoon, calorie, gramsPerUnit }
