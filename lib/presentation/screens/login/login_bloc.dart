import 'dart:async';
import 'package:bookapp_umg/presentation/screens/register/register.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/source/repository/AppRepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState(false)) {
    AppRepository appRepository = AppRepositoryImpl();
    on<LoginUser>((event, emit) async {
      logger.d(await appRepository.logIn(event.email, event.password));
      emit(state.copyWith(await appRepository.logIn(event.email, event.password)));
    });
    on<RegisterWithGoogle>((event, emit) async {
      try {
        if (await appRepository.authWithGoogle() == true) {
          emit(state.copyWith(true));
        }
      } catch (error) {
        print(error);
        emit(state.copyWith(false));
      }
    });
  }
}
