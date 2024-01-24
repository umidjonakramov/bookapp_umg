part of 'login_bloc.dart';

class LoginState {
  final bool response;

  const LoginState(this.response);

  LoginState copyWith(bool? response) =>
      LoginState(response ?? this.response);
}
