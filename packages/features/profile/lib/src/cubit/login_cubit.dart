import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authenticationRepository) : super(LoginState());
  AuthenticationRepository authenticationRepository;

  void login() async {
    emit(state.copyWith(loginStatus: FetchDataStatus.loading));
    try {
      await authenticationRepository.logIn();
      emit(state.copyWith(loginStatus: FetchDataStatus.loaded));
    } catch (e) {
      emit(state.copyWith(loginStatus: FetchDataStatus.error));
    }
  }
}
