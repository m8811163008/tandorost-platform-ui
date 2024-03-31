part of 'login_cubit.dart';

@immutable
class LoginState {
  final FetchDataStatus loginStatus;

  const LoginState({this.loginStatus = FetchDataStatus.initial});

  LoginState copyWith({FetchDataStatus? loginStatus}) =>
      LoginState(loginStatus: loginStatus ?? this.loginStatus);
}
