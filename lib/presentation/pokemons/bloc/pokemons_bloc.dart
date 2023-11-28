import 'dart:async';
import 'dart:developer';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ossos_test/domain/model/models.dart';
import 'package:ossos_test/domain/model/pokemons_repository.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  static const _pageSize = 5;
  final PagingController<int, Pokemon> pagingController =
      PagingController(firstPageKey: 1);
  final PokemonsRepository _pokemonsRepository;

  PokemonsBloc(this._pokemonsRepository) : super(PokemonsInitial()) {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    on<PokemonsRequested>(_onPokemonsRequested);
    on<PokemonDetailsRequested>(_onPokemonDetailsRequested);
  }

  Future<void> _onPokemonDetailsRequested(
      PokemonDetailsRequested event, Emitter<PokemonsState> emit) async {
    final either = await _pokemonsRepository.getPokemonDetails(url: event.url);

    either.fold((failure) {
      log('failed' + failure.message);
    }, (details) {
      if (state is PokemonsLoaded) {
        final newState = (state as PokemonsLoaded);

        final newPokemons = pagingController.itemList;
        final index = newPokemons!.indexWhere((pokemon) => pokemon.url == event.url);


        //update the image url
        newPokemons[index] = newPokemons[index].copyWith(image: details.image);

        emit(newState.copyWith(pokemons: [...newPokemons]));
      }
    });
  }

  Future<void> _onPokemonsRequested(
      PokemonsRequested event, Emitter<PokemonsState> emit) async {
    emit(PokemonsLoading());

    final either = await _pokemonsRepository.getPokemons(page: '');

    either.fold((failure) {
      emit(PokemnonsFailed(failure.message));
    }, (pokemons) {
      for (final pokemon in pokemons) {
        add(PokemonDetailsRequested(url: pokemon.url));
      }
      emit(PokemonsLoaded(pokemons: pokemons));
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      if (state is PokemonsLoaded) {


        final either =
            await _pokemonsRepository.getPokemons(page: pageKey.toString());

        either.fold((failure) {}, (newItems) {
          for (final pokemon in newItems) {
            add(PokemonDetailsRequested(url: pokemon.url));
          }
          final isLastPage = newItems.length < _pageSize;

          if (isLastPage) {
            pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + newItems.length;

            pagingController.appendPage(newItems, nextPageKey.toInt());
            emit((state as PokemonsLoaded)
                .copyWith(pokemons: pagingController.itemList));
          }
        });
      }
    } catch (error) {
      print('pagination error $error');
      pagingController.error = error;
    }
  }
}
