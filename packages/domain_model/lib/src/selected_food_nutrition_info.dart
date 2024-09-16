// ignore_for_file: public_member_api_docs, sort_constructors_first

class SelectedFoodsInfo {
  final int totalEnergy;
  final double carbohydrate;
  final double carbohydrateFruitVegerable;
  final double carbohydrateNonFruitVegerable;
  final double fat;
  final double protein;

  const SelectedFoodsInfo({
    required this.totalEnergy,
    required this.carbohydrate,
    required this.carbohydrateFruitVegerable,
    required this.carbohydrateNonFruitVegerable,
    required this.fat,
    required this.protein,
  });
  
  const SelectedFoodsInfo.empty()
      : totalEnergy = -1,
        carbohydrate = -1,
        carbohydrateFruitVegerable = -1,
        carbohydrateNonFruitVegerable = -1,
        fat = -1,
        protein = -1;

  double get sum => carbohydrate + fat + protein;

  double get carbPercent => carbohydrate / sum;
  double get carbFruitVegerablePercent => carbohydrateFruitVegerable / sum;
  double get carbNonFruitVegerablePercent =>
      carbohydrateNonFruitVegerable / sum;
  double get proteinPercent => protein / sum;
  double get fatPercent => fat / sum;
}
