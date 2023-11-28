import 'package:ossos_test/data/responses/pokemon_response.dart';
import 'package:ossos_test/domain/model/models.dart';



extension PokemonsMapper on PokemonBaseResponse? {
  List<Pokemon> toDomain() {
    return this?.pokemons?.map((e) => e.toDomain()).toList() ?? [];
  }
}
extension PokemonMapper on PokemonResponse? {
  Pokemon toDomain() {
    return Pokemon(url:  this?.url?? '' ,
        name: this?.name ?? '',

    );
  }
}
