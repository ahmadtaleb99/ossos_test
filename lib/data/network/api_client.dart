

import 'package:ossos_test/data/responses/pokemon_response.dart';

abstract class ApiClient {


  Future<PokemonBaseResponse>  getPokemonns(String page);


}
