import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ossos_test/domain/model/models.dart';
import 'package:ossos_test/presentation/pokemons/bloc/pokemons_bloc.dart';
import 'package:ossos_test/presentation/pokemons/pokemon_card.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.pokemons),
        ),
        body: BlocBuilder<PokemonsBloc, PokemonsState>(
          builder: (context, state) {

            if(state is PokemonsLoaded)
            return PokemonsList(pokemoms:state.pokemons,
              pagingController: context.read<PokemonsBloc>().pagingController,

            );


            if(state is PokemnonsFailed)
              return Center(child: Text(state.message),);


            return  Center(child: CircularProgressIndicator());
          },


        )
    );
  }
}


class PokemonsList extends StatelessWidget {
  const PokemonsList({Key? key, required this.pokemoms,required this.pagingController})
      : super(key: key);
  final List<Pokemon> pokemoms;
  final PagingController<int, Pokemon> pagingController;

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Pokemon>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Pokemon>(
        itemBuilder: (context, item, index) => PokemonCard(image: item.url, name: item.name,),
      ),
    );
  }
}
