import 'package:hive/hive.dart';
import 'package:local_storage/local_storage.dart';
part 'change_weight_speed.g.dart';

/// Change weight speed fot restDay for [trainingDayChangeValue] percent and for [restDayChangeValue] subsequently.
@HiveType(typeId: TypeIDs.changeWeightSpeed)
enum ChangeWeightSpeed {
  @HiveField(0)
  none(restDayChangeValue: 0, trainingDayChangeValue: 0),
  @HiveField(1)
  slowAndEasy(restDayChangeValue: 0.1, trainingDayChangeValue: 0),
  @HiveField(2)
  medium(restDayChangeValue: 0.1, trainingDayChangeValue: 0.05),
  @HiveField(3)
  fastAndHard(restDayChangeValue: 0.15, trainingDayChangeValue: 0.05);

  const ChangeWeightSpeed(
      {required this.trainingDayChangeValue, required this.restDayChangeValue});

  /// The value to reduce from TDEE in diet.
  final double trainingDayChangeValue;
  final double restDayChangeValue;
}
