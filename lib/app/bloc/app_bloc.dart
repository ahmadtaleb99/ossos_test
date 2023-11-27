import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState(null)) {
    on<NameChanged>(_onNameChanged);
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<AppState> emit) async {
    final name = event.name;

    if(name.isEmpty )
      emit(AppState(null));
    else
    emit(AppState(name));
  }
}