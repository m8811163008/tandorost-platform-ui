import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:food_repository/food_repository.dart';

part 'selected_foods_list_state.dart';

class SelectedFoodsListCubit extends Cubit<SelectedFoodsListState> {
  SelectedFoodsListCubit(FoodRepostiory foodRepository)
      : _foodRepository = foodRepository,
        super(SelectedFoodsListState()) {
    _filterSelectedFoodsList();
  }

  void _filterSelectedFoodsList() {
    _selectedFoodsListSubscription?.cancel();
    _selectedFoodsListSubscription = _foodRepository
        .selectedFoodsListStream(
            dateTimeRange: state.filterSelctedFoodsListDateTimeRange)
        .listen((selectedFoodsList) {
      selectedFoodsList
          .sort((a, b) => a.selectedDate.compareTo(b.selectedDate));

      emit(
        state.copyWith(
          selectedFoodsList: selectedFoodsList,
        ),
      );
    });
  }

  final FoodRepostiory _foodRepository;
  StreamSubscription<List<SelectedFoodCM>>? _selectedFoodsListSubscription;
  @override
  Future<void> close() {
    _selectedFoodsListSubscription?.cancel();

    return super.close();
  }

  void slectedFoodListFiltered(DateTimeRange dateTimeRange) async {
    emit(
      state.copyWith(
        filterSelctedFoodsListDateTimeRange: dateTimeRange,
      ),
    );
    _filterSelectedFoodsList();
  }

  void selectedFoodRemoved(SelectedFoodCM food) async {
    emit(
      state.copyWith(
        deleteSelectedFoodStatus: ProcessAsyncStatus.loading,
      ),
    );
    try {
      await _foodRepository.removeSelectedFood(food);

      emit(state.copyWith(
        deleteSelectedFoodStatus: ProcessAsyncStatus.success,
        lastDeletedSelectedFood: food,
      ));
    } catch (e) {
      emit(state.copyWith(deleteSelectedFoodStatus: ProcessAsyncStatus.error));
    }
  }

  void selectedFoodUndoRemoved() async {
    assert(state.lastDeletedSelectedFood != null,
        'propebly you call this method to early, or the state reseted');
    // to prevent call this method unnecessasarily.
    if (state.selectedFoodsList.contains(state.lastDeletedSelectedFood)) return;
    emit(
      state.copyWith(
        undoRemoveSelectedFoodStatus: ProcessAsyncStatus.loading,
      ),
    );
    try {
      await _foodRepository.upsertSelectedFood(state.lastDeletedSelectedFood!);
      emit(
        state.copyWith(
          undoRemoveSelectedFoodStatus: ProcessAsyncStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          undoRemoveSelectedFoodStatus: ProcessAsyncStatus.error,
        ),
      );
    }
  }

  /// Used when the user hold for long tap or onTap of list tile.
  void foodSelectedForNewFood(SelectedFoodCM selectedFood) {
    // final selectedFoodsForNewFood =
    //     Set<SelectedFoodCM>.from(state.selectedFoodsForNewFood);
    // if (state.selectedFoodsForNewFood.contains(selectedFood)) {
    //   //remove
    //   selectedFoodsForNewFood.remove(selectedFood);
    // } else {
    //   selectedFoodsForNewFood.add(selectedFood);
    // }
    // emit(
    //   state.copyWith(
    //     selectedFoodsForNewFood: selectedFoodsForNewFood,
    //   ),
    // );
  }

  void newFoodNameUpdated(String value) {
    emit(
      state.copyWith(
        newFoodName: value,
      ),
    );
  }

  void newFoodFromSelectedFoodsCreated() async {
    // assert(state.selectedFoodsForNewFood.isNotEmpty);
    emit(
      state.copyWith(
        creatingNewFood: ProcessAsyncStatus.loading,
      ),
    );
    // create FoodCM
    // FoodCM(name: 'Input', calorie: calorie, gramsPerUnit: gramsPerUnit, macroNutrition: macroNutrition);
//     final macroNutrition = state.selectedFoodsForNewFood.fold(MacroNutritionCM(), (previousValue, element) => null)

//     // chandta selectedfood mikhay foodcm besazi
//     final foodCM = FoodCM()
//     ..name = state.newFoodName
//     ..gramsPerUnit = state.selectedFoodsForNewFood.fold(0, (previousValue, element) =>previousValue! + element.totalWeight!)
//     ..isVegetable = state.selectedFoodsForNewFood.fold(true, (previousValue, element) => previousValue! && state.selectedFoodFoodCM.isVegetable!)
//     ..calorie = state.selectedFoodsForNewFood.fold(0, (previousValue, element) =>previousValue! + (element.totalWeight! * state.selectedFoodFoodCM.calorie!))
//     ;

// final foods = await _foodRepository.foodsStream.last;
//     // upsert new food
//     var newFood = state.selectedFoodsForNewFood.fold<SelectedFoodCM>(SelectedFoodCM(),
//         (previousValue, currentValue) {

// final previousValueSelectedFood = state.selectedFoodsForNewFood.singleWhere((whereClauseElement) => whereClauseElement.name == previousValue.name);
// final currentValueSelectedFood = state.selectedFoodsForNewFood.singleWhere((whereClauseElement) => whereClauseElement.name == currentValue.name);

//       final previousValueGramsPerUnitTotal =
//           previousValue.gramsPerUnit * previousValueSelectedFood.;
//       // final elementValueGramsPerUnitTotal = element.gramsPerUnit * 'tedad' ;
//       return previousValue.copyWith(
//         calorie: currentValue.calorie + previousValue.calorie,
//         gramsPerUnit: currentValue.gramsPerUnit + previousValue.gramsPerUnit,
//         macroNutrition: currentValue.macroNutrition + previousValue.macroNutrition,
//       );
//     });
//     // Todo handle is vegetable is approciate
//     newFood = newFood.copyWith(
//       name: state.newFoodName,
//     );
//     try {
//       // dont let to overwrite but inform
//       await _foodRepository.upsertFood(newFood);
//       emit(
//         state.copyWith(
//           creatingNewFood: ProcessAsyncStatus.loaded,
//         ),
//       );
//     } catch (e) {
//       emit(
//         state.copyWith(
//           creatingNewFood: ProcessAsyncStatus.error,
//         ),
//       );
//     }

//     // clear selectedFoodsForNewFood and name
  }
}
