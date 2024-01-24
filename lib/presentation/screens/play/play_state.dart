part of 'play_bloc.dart';

@immutable
abstract class PlayState {}

class PlayInitial extends PlayState {}

class OpenBookFileState extends PlayState {
  final String url;

  OpenBookFileState(this.url);
}
