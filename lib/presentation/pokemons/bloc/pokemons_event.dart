part of 'pokemons_bloc.dart';

abstract class PokemonsEvent extends Equatable {
  const PokemonsEvent();
}



class PokemonsRequested extends PokemonsEvent{
  @override
  List<Object?> get props => [ ];

}


class PokemonDetailsRequested extends PokemonsEvent{
  final String url;

  PokemonDetailsRequested({required this.url});
  @override
  List<Object?> get props => [url ];

}


