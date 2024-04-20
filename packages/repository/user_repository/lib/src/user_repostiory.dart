import 'package:domain_model/domain_model.dart';
import 'package:local_storage/local_storage.dart';
import 'package:user_repository/src/user_storage.dart';

class UserRepostiory {
  final UserStorage _userStorage;

  UserRepostiory(LocalStorage localStorage)
      : _userStorage = UserStorage(localStorage);

  Future<void> updateProfile(ProfileCM profileCM) =>
      _userStorage.updateProfile(profileCM);

  Stream<ProfileCM> get userProfile async* {
    yield* _userStorage.userProfile;
  }

  Future<void> clearCollections() async {
    await _userStorage.clearProfile();
  }

  /// Stream of diet info.
  ///
  /// Before listening to this stream, initilize the profile.
  Stream<DietInfo> get dietInfo async* {
    yield DietInfo.empty();
    yield* _userStorage.userProfile.map((profile) {
      assert(profile.isMale != null);
      assert(profile.birthday != null);
      return DietInfo(
        waistCircumference:
            profile.bodyComposition.waistCircumference.last.value.toDouble(),
        height: profile.bodyComposition.height.last.value.toDouble(),
        weight: profile.bodyComposition.weight.last.value.toDouble(),
        age: (DateTime.now().difference(profile.birthday!).inDays ~/ 365)
            .toDouble(),
        isMale: profile.isMale!,
        changeWeightSpeed: profile.settingCM.changeWeightSpeed,
        activityLevelCM: profile.bodyComposition.activityLevel.last.value,
      );
    });
  }
}
