import 'package:domain_model/domain_model.dart';

class User {
  User({this.selectedFoods = const []});

  List<Food> selectedFoods;
}
