import 'package:domain_model/domain_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc(this.foodRepostiory) : super(FoodState()) {
    on<FoodEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final FoodRepostiory foodRepostiory;
}
