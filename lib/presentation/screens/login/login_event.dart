part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUser extends LoginEvent {
  final String email;
  final String password;

  LoginUser(this.email, this.password);
}

class RegisterWithGoogle extends LoginEvent{}