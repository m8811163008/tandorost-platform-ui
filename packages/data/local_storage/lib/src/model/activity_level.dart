enum ActivityLevelCM {
  sedentary(1.2),
  fairyActive(1.3),
  moderatelyActive(1.4),
  active(1.5),
  veryActive(1.7);

  const ActivityLevelCM(this.multiplier);

  final double multiplier;
}
