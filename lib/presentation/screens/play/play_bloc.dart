import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_event.dart';
part 'play_state.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  PlayBloc() : super(PlayInitial()) {
    on<PlayEvent>((event, emit) {

    });
  }
}
