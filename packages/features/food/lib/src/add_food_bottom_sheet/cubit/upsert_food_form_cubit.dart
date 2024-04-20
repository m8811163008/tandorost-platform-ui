import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upsert_food_form_state.dart';

class UpsertFoodFormCubit extends Cubit<UpsertFoodFormState> {
  UpsertFoodFormCubit() : super(UpsertFoodFormInitial());
}
