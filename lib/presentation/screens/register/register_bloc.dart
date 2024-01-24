import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import '../../../data/source/repository/AppRepository.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterInitial> {
  RegisterBloc() : super(RegisterInitial(false)) {
    AppRepository appRepository = AppRepositoryImpl();

    on<RegisterUser>((event, emit) async {
      print(
          "apprepo register responce ${await appRepository.register(event.email, event.password)}");
      emit(state
          .copyWith(await appRepository.register(event.email, event.password)));
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
