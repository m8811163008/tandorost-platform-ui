import 'package:hive/hive.dart';
import 'package:local_storage/local_storage.dart';
part 'change_weight_speed.g.dart';

/// Change weight speed fot restDay for [trainingDayChangeValue] percent and for [restDayChangeValue] subsequently.
@HiveType(typeId: TypeIDs.changeWeightSpeed)
enum ChangeWeightSpeed {
  @HiveField(0)
  none(restDayChangeValue: 0, trainingDayChangeValue: 0),
  @HiveField(1)
  slowAndEasy(restDayChangeValue: 0, trainingDayChangeValue: 0.1),
  @HiveField(2)
  medium(restDayChangeValue: 0.05, trainingDayChangeValue: 0.1),
  @HiveField(3)
  fastAndHard(restDayChangeValue: 0.05, trainingDayChangeValue: 0.15);

  const ChangeWeightSpeed(
      {required this.trainingDayChangeValue, required this.restDayChangeValue});

  final double trainingDayChangeValue;
  final double restDayChangeValue;
}
