part of 'splash_cubit.dart';

@immutable
class SplashState {
  const SplashState({this.userRules = const {}});
  final Set<UserRule> userRules;
  SplashState copyWith({Set<UserRule>? userRules}) {
    return SplashState(userRules: userRules ?? this.userRules);
  }
}
