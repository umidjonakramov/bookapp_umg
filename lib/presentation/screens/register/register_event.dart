part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterUser extends RegisterEvent{
  final String email;
  final String password;

  RegisterUser(this.email, this.password);
}

class RegisterWithGoogle extends RegisterEvent {}