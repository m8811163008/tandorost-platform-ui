import 'package:isar/isar.dart';
import 'package:local_storage/local_storage.dart';

part 'user.g.dart';

@collection
class UserCM {
  Id id = 0;

  List<SelectedFoodCM> selectedFoods = List.empty(growable: true);
}

@embedded
class SelectedFoodCM {
  late DateTime selectedDate;
  late FoodDataCM food;
}
