import 'package:hive/hive.dart';
import 'package:local_storage/local_storage.dart';
part 'change_weight_speed.g.dart';

@HiveType(typeId: TypeIDs.changeWeightSpeed)
enum ChangeWeightSpeed {
  @HiveField(0)
  none,
  @HiveField(1)
  slowAndEasy,
  @HiveField(2)
  medium,
  @HiveField(3)
  fastAndHard,
}
