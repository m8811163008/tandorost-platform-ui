import 'package:local_storage/local_storage.dart';

extension MapToCM on Map<String, dynamic> {
  FoodCM foodCMfromJson(Map<String, dynamic> json) {
    final foodData = foodDataCMFromJson(json);
    final food = FoodCM();
    food.foodDataCM = foodData;
    return food;
  }

  FoodDataCM foodDataCMFromJson(Map<String, dynamic> json) {
    final foodData = FoodDataCM();
    foodData.name = json['name'] as String;
    foodData.calorie = json['calorie'] as int;
    return foodData;
  }

  UnitOfMeasurmentCM unitOfMeasurmentCMFromJson(Map<String, dynamic> json) {
    final unitOfMeasurment = UnitOfMeasurmentCM();
    unitOfMeasurment.title = json['title'] as String;
    unitOfMeasurment.icon = json['icon'] as String;
    unitOfMeasurment.howManyGrams = json['howManyGrams'] as double;
    return unitOfMeasurment;
  }
}
