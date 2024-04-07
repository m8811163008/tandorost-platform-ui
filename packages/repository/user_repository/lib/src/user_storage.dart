import 'package:local_storage/local_storage.dart';

class UserStorage {
  final LocalStorage localStorage;
  UserStorage(this.localStorage);
  Future<void> updateProfile(ProfileCM profileCM) async {
    final userCollection = await localStorage.userCollection;
    userCollection.isar.writeTxn(() async {
      final user = await userCollection.get(0);
      if (user == null) throw Exception('User is null');
      user.profileCM = profileCM;
      await userCollection.put(user);
    });
  }

  Stream<ProfileCM> get userProfile async* {
    final userCollection = await localStorage.userCollection;
    yield* await userCollection.isar.txn<Stream<ProfileCM>>(() async {
      final user = await userCollection.get(0);
      if (user == null) throw Exception('User is null');
      return userCollection
          .watchObject(0, fireImmediately: true)
          .map((event) => event!.profileCM)
          .asBroadcastStream();
    });
  }
}
