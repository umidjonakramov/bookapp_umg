import 'dart:async';

import 'package:bookapp_umg/data/common/bood_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  MainBloc() : super(const MainState([])) {
    on<LoadAllBooks>((event, emit) async {
      emit(state.copyWith(await getBooks()));
    });
  }
  Future<List<BookModel>> getBooks() async {
    var result = fireStore.collection("books").get();

    return  await result.then((value) => value.docs.map((e) {
      return BookModel.fromJson(e.data());}).toList());
  }
}
