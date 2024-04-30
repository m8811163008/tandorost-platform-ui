part of 'splash_cubit.dart';

@immutable
class SplashState {
  const SplashState({this.userRules = const {}, this.exception});
  final Set<UserRule> userRules;
  final String? exception;
  SplashState copyWith({Set<UserRule>? userRules, String? exception}) {
    return SplashState(
        userRules: userRules ?? this.userRules,
        exception: exception ?? this.exception);
  }
}
