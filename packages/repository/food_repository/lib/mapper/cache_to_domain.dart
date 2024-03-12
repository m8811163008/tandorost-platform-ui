import 'package:cache_storage/cache_storage.dart';
import 'package:domain_model/domain_model.dart';

extension FoodCMToDomain on FoodCM {
  Food toDomain() {
    return Food(
      name: name,
      calorie: calorie,
    );
  }
}
