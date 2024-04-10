// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

@immutable
class ProfileState {
  final ProcessAsyncStatus resettingStatus;

  final ProfileCM? lastUpdatedProfileCM;

  const ProfileState({
    this.resettingStatus = ProcessAsyncStatus.initial,
    this.lastUpdatedProfileCM,
  });

  ProfileState copyWith({
    ProcessAsyncStatus? resettingStatus,
    ProfileCM? lastUpdatedProfileCM,
  }) {
    return ProfileState(
      resettingStatus: resettingStatus ?? this.resettingStatus,
      lastUpdatedProfileCM: lastUpdatedProfileCM ?? this.lastUpdatedProfileCM,
    );
  }

  @override
  bool operator ==(covariant ProfileState other) {
    if (identical(this, other)) return true;

    return other.resettingStatus == resettingStatus &&
        other.lastUpdatedProfileCM == lastUpdatedProfileCM;
  }

  @override
  int get hashCode => resettingStatus.hashCode ^ lastUpdatedProfileCM.hashCode;
}
