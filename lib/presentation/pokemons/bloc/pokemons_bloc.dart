import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ossos_test/domain/model/models.dart';
import 'package:ossos_test/domain/model/pokemons_repository.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {


  static const _pageSize = 10;
  final PagingController<int, Pokemon> pagingController = PagingController(firstPageKey: 1);
  final PokemonsRepository _pokemonsRepository;

  PokemonsBloc(this._pokemonsRepository) : super(PokemonsInitial()) {

    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    on<PokemonsRequested>(_onPokemonsRequested);

  }

  Future<void> _onPokemonsRequested(
      PokemonsRequested event, Emitter<PokemonsState> emit) async {


    emit(PokemonsLoading());


    final either = await _pokemonsRepository.getPokemons(page: '');

    either.fold((failure) {
      emit(PokemnonsFailed(failure.message));
    }, (pokemons) {
      emit(PokemonsLoaded(pokemons: pokemons));
    });



  }


  Future<void> _fetchPage(int pageKey) async {
    try {
      if(state is PokemonsLoaded) {
        if(pagingController.itemList == null )
          pagingController.itemList = (state as PokemonsLoaded).pokemons;

        final either = await _pokemonsRepository.getPokemons(page: pageKey.toString());

        either.fold((failure) {

        }, (newItems) {
          final isLastPage = newItems.length < _pageSize;

          if (isLastPage) {
            pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + newItems.length;
            pagingController.appendPage(newItems, nextPageKey.toInt());
          }
        });


      }
    } catch (error) {
      print('pagination error $error');
      pagingController.error = error;
    }
  }

}



