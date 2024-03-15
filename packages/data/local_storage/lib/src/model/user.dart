import 'package:isar/isar.dart';
import 'package:local_storage/local_storage.dart';
import 'package:local_storage/src/model/unit_of_measurement.dart';

part 'user.g.dart';

@collection
class UserCM {
  Id id = 0;

  List<SelectedFoodCM> selectedFoods = List.empty(growable: true);
}
