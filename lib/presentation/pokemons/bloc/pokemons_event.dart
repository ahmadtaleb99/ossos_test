part of 'pokemons_bloc.dart';

abstract class PokemonsEvent extends Equatable {
  const PokemonsEvent();
}



class PokemonsRequested extends PokemonsEvent{
  @override
  List<Object?> get props => [ ];

}