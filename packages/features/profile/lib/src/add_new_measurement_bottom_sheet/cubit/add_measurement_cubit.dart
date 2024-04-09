import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:meta/meta.dart';
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

      var bodyCompositionCM = _createBodyComposition(profile);

      profile = profile.copyWith(
        bodyComposition: bodyCompositionCM,
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

  BodyCompositionCM _createBodyComposition(ProfileCM profile) {
    var bodyCompositionCM = BodyCompositionCM();
    final logTime = DateTime.now();

    if (state.bodyCompositionValues.activityLevel != null) {
      bodyCompositionCM = bodyCompositionCM.copyWith(activityLevel: [
        ...profile.bodyComposition.activityLevel,
        ActivityLevelCMData(
            logDate: logTime, value: state.bodyCompositionValues.activityLevel!)
      ]);
    }

    if (state.bodyCompositionValues.armCircumference != null) {
      if (state.bodyCompositionValues.calfMuscleCircumference!.isNotEmpty) {
        bodyCompositionCM = bodyCompositionCM.copyWith(armCircumference: [
          ...profile.bodyComposition.armCircumference,
          BioDataCM(
              logDate: logTime,
              value: int.parse(state.bodyCompositionValues.armCircumference!))
        ]);
      }
    }
    if (state.bodyCompositionValues.calfMuscleCircumference != null) {
      if (state.bodyCompositionValues.calfMuscleCircumference!.isNotEmpty) {
        bodyCompositionCM =
            bodyCompositionCM.copyWith(calfMuscleCircumference: [
          ...profile.bodyComposition.calfMuscleCircumference,
          BioDataCM(
              logDate: logTime,
              value: int.parse(
                  state.bodyCompositionValues.calfMuscleCircumference!))
        ]);
      }
    }
    if (state.bodyCompositionValues.chestCircumference != null) {
      if (state.bodyCompositionValues.calfMuscleCircumference!.isNotEmpty) {
        bodyCompositionCM = bodyCompositionCM.copyWith(chestCircumference: [
          ...profile.bodyComposition.chestCircumference,
          BioDataCM(
              logDate: logTime,
              value: int.parse(state.bodyCompositionValues.chestCircumference!))
        ]);
      }
    }
    if (state.bodyCompositionValues.height != null) {
      if (state.bodyCompositionValues.calfMuscleCircumference!.isNotEmpty) {}
      bodyCompositionCM = bodyCompositionCM.copyWith(height: [
        ...profile.bodyComposition.height,
        BioDataCM(
          logDate: logTime,
          value: state.bodyCompositionValues.height!,
        )
      ]);
    }
    if (state.bodyCompositionValues.hipCircumference != null) {
      if (state.bodyCompositionValues.hipCircumference!.isNotEmpty) {
        bodyCompositionCM = bodyCompositionCM.copyWith(hipCircumference: [
          ...profile.bodyComposition.hipCircumference,
          BioDataCM(
            logDate: logTime,
            value: int.parse(state.bodyCompositionValues.hipCircumference!),
          )
        ]);
      }
    }
    if (state.bodyCompositionValues.thightCircumference != null) {
      if (state.bodyCompositionValues.thightCircumference!.isNotEmpty) {
        bodyCompositionCM = bodyCompositionCM.copyWith(thightCircumference: [
          ...profile.bodyComposition.thightCircumference,
          BioDataCM(
            logDate: logTime,
            value: int.parse(state.bodyCompositionValues.thightCircumference!),
          )
        ]);
      }
    }
    if (state.bodyCompositionValues.waistCircumference != null) {
      bodyCompositionCM = bodyCompositionCM.copyWith(waistCircumference: [
        ...profile.bodyComposition.waistCircumference,
        BioDataCM(
          logDate: logTime,
          value: state.bodyCompositionValues.waistCircumference!,
        )
      ]);
    }
    if (state.bodyCompositionValues.weight != null) {
      bodyCompositionCM = bodyCompositionCM.copyWith(weight: [
        ...profile.bodyComposition.weight,
        BioDataCM(
          logDate: logTime,
          value: state.bodyCompositionValues.weight!,
        )
      ]);
    }

    return bodyCompositionCM;
  }
}
