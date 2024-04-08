import 'package:local_storage/local_storage.dart';

class UserStorage {
  final LocalStorage localStorage;
  UserStorage(this.localStorage);
  Future<void> updateProfile(ProfileCM profileCM) async {
    final profileBox = await localStorage.profileBox;

    profileBox.put(ProfileCM.id, profileCM);
  }

  Stream<ProfileCM> get userProfile async* {
    final profileBox = await localStorage.profileBox;
    yield* profileBox.watch(key: ProfileCM.id).map(
          (event) => profileBox.get(ProfileCM.id)!,
        );
  }
}
