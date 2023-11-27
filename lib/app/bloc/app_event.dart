part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class NameChanged extends AppEvent {
  final String name;

  const NameChanged(this.name);
  @override
  List<Object?> get props => [name];
}


class NameCleared extends AppEvent {

  const NameCleared();
  @override
  List<Object?> get props => [];
}