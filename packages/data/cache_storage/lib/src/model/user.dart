import 'package:cache_storage/cache_storage.dart';

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
