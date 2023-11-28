import 'package:json_annotation/json_annotation.dart';
import 'package:ossos_test/data/responses/base_response.dart';

part 'pokemon_response.g.dart';


@JsonSerializable()
class PokemonBaseResponse extends BaseResponse {
  @JsonKey(name: 'count')
  int? count;

  @JsonKey(name: 'next')
  String? next;

  @JsonKey(name: 'previous')
  String? previous;

  @JsonKey(name: 'results')
  List<PokemonResponse>? pokemons;

  PokemonBaseResponse(this.pokemons, this.count,this.next,this.previous);

  factory PokemonBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonBaseResponseToJson(this);
}



@JsonSerializable()
class PokemonResponse {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'url')
  String? url;

  PokemonResponse(this.name, this.url);

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}

@JsonSerializable()
class PokemonDetailsResponse extends BaseResponse{
  @JsonKey(name: 'id')
   int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'sprites')
  SpritesResponse? sprites;

  PokemonDetailsResponse(this.id,this.name,this.sprites);

  factory PokemonDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonDetailsResponseToJson(this);
}



@JsonSerializable()
class SpritesResponse {
  @JsonKey(name: 'front_default')
  String? image;
  SpritesResponse(this.image);

  factory SpritesResponse.fromJson(Map<String, dynamic> json) =>
      _$SpritesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SpritesResponseToJson(this);
}
