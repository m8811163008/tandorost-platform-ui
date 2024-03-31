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
}
