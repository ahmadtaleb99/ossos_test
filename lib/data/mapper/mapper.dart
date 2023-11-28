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
        name: this?.name ?? '', image: null,

    );
  }
}


extension PokemonDetailsMapper on PokemonDetailsResponse? {
  PokemonDetails toDomain() {
    return PokemonDetails(id: this?.id ?? 0, name: this?.name ?? '', image: this?.sprites?.image ?? '');
  }
}
