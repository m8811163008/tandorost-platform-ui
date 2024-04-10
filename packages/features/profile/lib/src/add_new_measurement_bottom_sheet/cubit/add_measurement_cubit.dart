import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:meta/meta.dart';
import 'package:profile/src/mapper/domain_to_cache.dart';
import 'package:user_repository/user_repository.dart';

part 'add_measurement_state.dart';

class AddMeasurementCubit extends Cubit<AddMeasurementState> {
  AddMeasurementCubit(this.userRepostiory) : super(const AddMeasurementState());
  final UserRepostiory userRepostiory;

  void upsertArmCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          armCircumference: () => value,
        ),
      ),
    );
  }

  void upsertWeight(String value) {
    if (value.isEmpty) return;
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          weight: () => int.parse(value),
        ),
      ),
    );
  }

  void upsertActivityLevelChanging(ActivityLevelCM? value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          activityLevel: () => value,
        ),
      ),
    );
  }

  void upsertChestCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          chestCircumference: () => value,
        ),
      ),
    );
  }

  void upsertThightCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          thightCircumference: () => value,
        ),
      ),
    );
  }

  void upsertHipCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          hipCircumference: () => value,
        ),
      ),
    );
  }

  void upsertCalfMuscleCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          calfMuscleCircumference: () => value,
        ),
      ),
    );
  }

  void upsertWaiseCircumference(String value) {
    emit(
      state.copyWith(
        bodyCompositionValues: state.bodyCompositionValues.copyWith(
          waistCircumference: () => int.tryParse(value),
        ),
      ),
    );
  }

  void saveNewMeasurement() async {
    if (state.bodyCompositionValues != const BodyCompositionValues()) {
      emit(
        state.copyWith(
          formSubmitStatus: ProcessAsyncStatus.loading,
        ),
      );
      var profile = await userRepostiory.userProfile.first;
      // state.bodyCompositionValues; => BodyCompositionCM? bodyComposition

      profile = profile.copyWith(
        bodyComposition:
            profile.bodyComposition.merge(state.bodyCompositionValues),
      );

      try {
        await userRepostiory.updateProfile(profile);
        emit(state.copyWith(
          formSubmitStatus: ProcessAsyncStatus.success,
        ));
      } catch (e) {
        emit(
          state.copyWith(
            formSubmitStatus: ProcessAsyncStatus.error,
          ),
        );
      }
    }
  }
}
