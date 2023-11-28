import 'package:flutter/material.dart';
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
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index) {
        return PokemonCard();
      }),
    );
  }
}
