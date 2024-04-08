import 'package:hive/hive.dart';
part 'activity_level.g.dart';

@HiveType(typeId: 8)
enum ActivityLevelCM {
  @HiveField(0)
  sedentary(1.2),
  @HiveField(1)
  fairyActive(1.3),
  @HiveField(2)
  moderatelyActive(1.4),
  @HiveField(3)
  active(1.5),
  @HiveField(4)
  veryActive(1.7);

  const ActivityLevelCM(this.multiplier);

  final double multiplier;
}
