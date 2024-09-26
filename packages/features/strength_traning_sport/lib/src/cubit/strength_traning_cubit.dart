import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'strength_traning_state.dart';

class StrengthTraningCubit extends Cubit<StrengthTraningState> {
  StrengthTraningCubit() : super(StrengthTraningInitial());
}
