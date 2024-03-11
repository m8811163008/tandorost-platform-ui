import 'package:cache_storage/cache_storage.dart';
import 'package:isar/isar.dart';
part 'food_list.g.dart';

@collection
class FoodListCM {
  Id id = 0;

  List<FoodStaticticsCM> foods = List.empty(growable: true);
}
