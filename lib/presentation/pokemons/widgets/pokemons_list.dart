import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ossos_test/domain/model/models.dart';
import 'package:ossos_test/presentation/pokemons/widgets/pokemon_card.dart';


class PokemonsList extends StatelessWidget {
  const PokemonsList(
      {Key? key, required this.pokemoms, required this.pagingController})
      : super(key: key);
  final List<Pokemon> pokemoms;
  final PagingController<int, Pokemon> pagingController;

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Pokemon>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Pokemon>(
        itemBuilder: (context, item, index) => PokemonCard(
          image: item.image ?? '',
          name: item.name,
        ),
      ),
    );
  }
}
