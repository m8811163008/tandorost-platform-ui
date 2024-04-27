import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:food_repository/food_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'selected_foods_list_state.dart';

class SelectedFoodsListCubit extends Cubit<SelectedFoodsListState> {
  SelectedFoodsListCubit({
    required FoodRepostiory foodRepository,
    required UserRepostiory userRepostiory,
    required AuthRepostiory authRepostiory,
  })  : _foodRepository = foodRepository,
        _userRepostiory = userRepostiory,
        _authRepostiory = authRepostiory,
        super(SelectedFoodsListState()) {
    _filterSelectedFoodsList();
    _initializeDietInfoCm();
    _initializeProfileCm();
  }
  void _initializeDietInfoCm() {
    _dietInfoSubscription = _userRepostiory.dietInfo.listen((event) {
      if (isClosed) return;
      (state.copyWith(
        dietInfo: event,
      ));
    });
  }

  void _initializeProfileCm() {
    _profileSubscription = _userRepostiory.userProfile.listen((event) {
      if (isClosed) return;
      emit(state.copyWith(
        profileCM: event,
      ));
    });
  }

  void updateDayActivityLevel(DayActivityLevel dayActivityLevel) {
    if (isClosed) return;
    emit(state.copyWith(dayActivityLevel: dayActivityLevel));
  }

  late StreamSubscription<DietInfo> _dietInfoSubscription;
  late StreamSubscription<ProfileCM> _profileSubscription;

  @override
  Future<void> close() {
    _selectedFoodsListSubscription?.cancel();
    _dietInfoSubscription.cancel();
    _profileSubscription.cancel();
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

      if (isClosed) return;
      emit(
        state.copyWith(
          selectedFoodsList: selectedFoodsList,
        ),
      );
      _updateSelectedFoodsInfo();
      _updatefilterDaysDuration();
    });
  }

  void _updatefilterDaysDuration() {
    if (state.selectedFoodsList.isEmpty) return;
    final lastSelectedFoodDateTime = state.selectedFoodsList
        .reduce((value, element) =>
            value.selectedDate.isBefore(element.selectedDate) ? element : value)
        .selectedDate;
    final lastEffectiveSelectedDateTime =
        lastSelectedFoodDateTime.isBefore(DateTime.now())
            ? DateTime.now()
            : lastSelectedFoodDateTime;
    final days = (lastEffectiveSelectedDateTime
                .difference(state.filterSelctedFoodsListDateTimeRange.start)
                .inHours /
            24)
        .ceil();
    if (isClosed) return;
    emit(
      state.copyWith(filterDays: days),
    );
  }

  void _updateSelectedFoodsInfo() {
    final double carbohydrateSum = state.selectedFoodsList.fold(
        0.0,
        (prev, current) =>
            prev +
            current.food.macroNutrition.carbohydrate * current.totalWeight);
    final double carbohydrateNonFruitVegerableSum = state.selectedFoodsList
        .where((element) => !element.food.isVegetable)
        .fold(
            0.0,
            (prev, current) =>
                prev +
                current.food.macroNutrition.carbohydrate * current.totalWeight);
    final double carbohydrateFruitVegerableSum = state.selectedFoodsList
        .where((element) => element.food.isVegetable)
        .fold(
            0.0,
            (prev, current) =>
                prev +
                current.food.macroNutrition.carbohydrate * current.totalWeight);
    assert(carbohydrateFruitVegerableSum + carbohydrateNonFruitVegerableSum <=
        carbohydrateSum);
    final double fatSum = state.selectedFoodsList.fold(
        0.0,
        (prev, current) =>
            prev + current.food.macroNutrition.fat * current.totalWeight);
    final double proteinSum = state.selectedFoodsList.fold(
        0.0,
        (prev, current) =>
            prev + current.food.macroNutrition.protein * current.totalWeight);

    final int totalEnergy = state.selectedFoodsList.fold(
        0,
        (prev, current) =>
            prev + (current.totalWeight * current.food.calorie).toInt());

    final SelectedFoodsInfo selectedFoodsInfo = SelectedFoodsInfo(
      totalEnergy: totalEnergy,
      carbohydrate: carbohydrateSum,
      carbohydrateFruitVegerable: carbohydrateFruitVegerableSum,
      carbohydrateNonFruitVegerable: carbohydrateNonFruitVegerableSum,
      fat: fatSum,
      protein: proteinSum,
    );
    if (isClosed) return;
    emit(
      state.copyWith(
        selectedFoodsInfo: selectedFoodsInfo,
      ),
    );
  }

  final FoodRepostiory _foodRepository;
  final UserRepostiory _userRepostiory;
  final AuthRepostiory _authRepostiory;
  StreamSubscription<List<SelectedFoodCM>>? _selectedFoodsListSubscription;

  void slectedFoodListFiltered(DateTimeRange dateTimeRange) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        filterSelctedFoodsListDateTimeRange: dateTimeRange,
      ),
    );
    _filterSelectedFoodsList();
  }

  void selectedFoodRemoved(SelectedFoodCM food) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        deleteSelectedFoodStatus: ProcessAsyncStatus.loading,
      ),
    );
    try {
      await _foodRepository.removeSelectedFood(food);

      if (isClosed) return;
      emit(state.copyWith(
        deleteSelectedFoodStatus: ProcessAsyncStatus.success,
        lastDeletedSelectedFoods: [...state.lastDeletedSelectedFoods, food],
      ));
    } catch (e) {
      if (isClosed) return;
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
    if (isClosed) return;
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
      if (isClosed) return;
      emit(
        state.copyWith(
            undoRemoveSelectedFoodStatus: ProcessAsyncStatus.success,
            lastDeletedSelectedFoods: updatedLasLeletedFoods),
      );
    } catch (e) {
      if (isClosed) return;
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
    if (isClosed) return;
    emit(
      state.copyWith(
        selectedFoodsForNewFood: selectedFoodsForNewFood,
      ),
    );
  }

  void newFoodNameUpdated(String value) {
    // todo handle overwrite foods
    if (isClosed) return;
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
    if (isClosed) return;
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
      if (isClosed) return;
      emit(
        state.copyWith(
          creatingNewFoodFromSelectionStatus: ProcessAsyncStatus.success,
          selectedFoodsForNewFood: const {},
        ),
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          creatingNewFoodFromSelectionStatus: ProcessAsyncStatus.error,
        ),
      );
    }

//     // clear selectedFoodsForNewFood and name
  }

  void subscribe(SubscriptionPlan subscriptionPlan) async {
    if (isClosed) return;
    emit(state.copyWith(puchaseSubscriptionStatus: ProcessAsyncStatus.loading));
    try {
      await _authRepostiory.subscribe(subscriptionPlan);
      if (isClosed) return;
      emit(
        state.copyWith(puchaseSubscriptionStatus: ProcessAsyncStatus.success),
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(puchaseSubscriptionStatus: ProcessAsyncStatus.error),
      );
    }
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
