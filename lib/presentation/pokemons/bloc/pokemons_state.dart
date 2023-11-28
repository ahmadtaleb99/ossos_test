part of 'pokemons_bloc.dart';

abstract class PokemonsState extends Equatable {
  const PokemonsState();
}

class PokemonsInitial extends PokemonsState {
  @override
  List<Object> get props => [];
}


class PokemonsLoaded extends PokemonsState {
  final List<Pokemon> pokemons;

  @override
  List<Object?> get props =>[ ];

  const PokemonsLoaded({
    required this.pokemons,
  });

  PokemonsLoaded copyWith({
    List<Pokemon>? pokemons,
  }) {
    return PokemonsLoaded(
      pokemons: pokemons ?? this.pokemons,
    );
  }
}

class PokemonsLoading extends PokemonsState{
  @override
  List<Object?> get props => [];

}

class PokemnonsFailed extends PokemonsState {
  final String message;
  PokemnonsFailed(this.message);
  @override
  List<Object> get props => [message];
}