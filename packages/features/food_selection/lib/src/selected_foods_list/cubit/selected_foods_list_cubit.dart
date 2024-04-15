import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:food_repository/food_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'selected_foods_list_state.dart';

class SelectedFoodsListCubit extends Cubit<SelectedFoodsListState> {
  SelectedFoodsListCubit(
      {required FoodRepostiory foodRepository,
      required UserRepostiory userRepostiory})
      : _foodRepository = foodRepository,
        _userRepostiory = userRepostiory,
        super(SelectedFoodsListState()) {
    _filterSelectedFoodsList();
    _initializeDietInfoCm();
  }
  void _initializeDietInfoCm() {
    _dietInfoSubscription = _userRepostiory.dietInfo.listen((event) {
      emit(state.copyWith(
        dietInfo: event,
      ));
    });
  }

  void updateDayActivityLevel(DayActivityLevel dayActivityLevel) {
    emit(state.copyWith(dayActivityLevel: dayActivityLevel));
  }

  late StreamSubscription<DietInfo> _dietInfoSubscription;

  @override
  Future<void> close() {
    _selectedFoodsListSubscription?.cancel();
    _dietInfoSubscription.cancel();
    return super.close();
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
  final UserRepostiory _userRepostiory;
  StreamSubscription<List<SelectedFoodCM>>? _selectedFoodsListSubscription;

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
        lastDeletedSelectedFoods: [...state.lastDeletedSelectedFoods, food],
      ));
    } catch (e) {
      emit(state.copyWith(deleteSelectedFoodStatus: ProcessAsyncStatus.error));
    }
  }

  void selectedFoodUndoRemoved() async {
    assert(
      state.lastDeletedSelectedFoods.isNotEmpty,
    );
    // to prevent call this method unnecessasarily.
    if (state.selectedFoodsList.contains(state.lastDeletedSelectedFoods.last)) {
      return;
    }
    emit(
      state.copyWith(
        undoRemoveSelectedFoodStatus: ProcessAsyncStatus.loading,
      ),
    );
    try {
      await _foodRepository
          .upsertSelectedFood(state.lastDeletedSelectedFoods.last);
      List<SelectedFoodCM> updatedLasLeletedFoods =
          state.lastDeletedSelectedFoods;
      updatedLasLeletedFoods.removeLast();
      emit(
        state.copyWith(
            undoRemoveSelectedFoodStatus: ProcessAsyncStatus.success,
            lastDeletedSelectedFoods: updatedLasLeletedFoods),
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
    final selectedFoodsForNewFood =
        Set<SelectedFoodCM>.from(state.selectedFoodsForNewFood);
    if (state.selectedFoodsForNewFood.contains(selectedFood)) {
      //remove
      selectedFoodsForNewFood.remove(selectedFood);
    } else {
      selectedFoodsForNewFood.add(selectedFood);
    }
    emit(
      state.copyWith(
        selectedFoodsForNewFood: selectedFoodsForNewFood,
      ),
    );
  }

  void newFoodNameUpdated(String value) {
    // todo handle overwrite foods
    emit(
      state.copyWith(
        newFoodName: value,
      ),
    );
  }

  /// saves the new food from selection by name
  void newFoodFromSelectedFoodsCreated() async {
    assert(state.selectedFoodsForNewFood.isNotEmpty);
    assert(state.newFoodName.isNotEmpty);
    emit(
      state.copyWith(
        creatingNewFoodFromSelectionStatus: ProcessAsyncStatus.loading,
      ),
    );
    final calorie = state.selectedFoodsForNewFood.fold(0.0,
            (previousValue, element) => previousValue + element.food.calorie) /
        state.selectedFoodsForNewFood.length;
    final gramsPerUnit = state.selectedFoodsForNewFood.fold(
        0, (previousValue, element) => previousValue + (element.totalWeight));
    final macroNutrition = state.selectedFoodsForNewFood.fold<MacroNutritionCM>(
        state.selectedFoodsForNewFood.first.food.macroNutrition,
        (previousValue, element) =>
            previousValue + element.food.macroNutrition);
    final isVegetable = state.selectedFoodsForNewFood.fold(true,
        (previousValue, element) => previousValue & element.food.isVegetable);

    final food = FoodCM(
      name: state.newFoodName,
      calorie: calorie,
      gramsPerUnit: gramsPerUnit,
      macroNutrition: macroNutrition,
      isVegetable: isVegetable,
    );

    try {
      // TODO hanlde overwrite
      await _foodRepository.upsertFood(food);
      emit(
        state.copyWith(
          creatingNewFoodFromSelectionStatus: ProcessAsyncStatus.success,
          selectedFoodsForNewFood: const {},
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          creatingNewFoodFromSelectionStatus: ProcessAsyncStatus.error,
        ),
      );
    }

//     // clear selectedFoodsForNewFood and name
  }
}

extension on MacroNutritionCM {
  MacroNutritionCM operator +(MacroNutritionCM other) {
    final macro = MacroNutritionCM(
      carbohydrate: (carbohydrate + other.carbohydrate) / 2,
      fat: (fat + other.fat) / 2,
      protein: (protein + other.protein) / 2,
    );

    return macro;
  }
}
