import 'dart:developer';

import 'package:local_storage/local_storage.dart';

class UserStorage {
  final LocalStorage _localStorage;
  UserStorage(this._localStorage) {
    initializeProfile();
  }

  Future<void> initializeProfile() async {
    final userCollection = await _localStorage.profileBox;
    final count = userCollection.length;
    if (count != 0) return;
    final user = ProfileCM.empty();

    await userCollection.put(ProfileCM.id, user);
  }

  Future<void> updateProfile(ProfileCM profileCM) async {
    final profileBox = await _localStorage.profileBox;

    profileBox.put(ProfileCM.id, profileCM);
  }

  Stream<ProfileCM> get userProfile async* {
    final profileBox = await _localStorage.profileBox;

    yield profileBox.get(ProfileCM.id)!;
    yield* profileBox.watch(key: ProfileCM.id).map(
      (event) {
        return profileBox.get(ProfileCM.id) ?? ProfileCM.empty();
      },
    );
  }

  Future<void> clearProfile() async {
    final userCollection = await _localStorage.profileBox;
    await userCollection.clear();

    log('Cleared user box');
    await initializeProfile();
    log('Initialized foodBox and unitOfmeasurementBox');
  }
}
