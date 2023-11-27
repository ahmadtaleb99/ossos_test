part of 'app_bloc.dart';

 class AppState extends Equatable {
  const AppState(this.name);


  final String? name;
  @override
  List<Object?> get props => [name];


}

