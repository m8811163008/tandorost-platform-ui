class Food {
  final String name;
  final int? calorie;
  final DateTime? selectedDate;

  const Food({
    required this.name,
    this.calorie,
    this.selectedDate,
  });
}
