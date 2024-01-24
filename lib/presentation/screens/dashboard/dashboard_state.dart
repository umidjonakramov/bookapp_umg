part of 'dashboard_bloc.dart';

@immutable
class MainState {
  final List<BookModel> books;

  const MainState(this.books);

  MainState copyWith(List<BookModel>? books){
    return MainState(books??this.books);
  }
}
