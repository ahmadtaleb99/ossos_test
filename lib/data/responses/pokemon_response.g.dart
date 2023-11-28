// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonBaseResponse _$PokemonBaseResponseFromJson(Map<String, dynamic> json) =>
    PokemonBaseResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => PokemonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int?,
      json['next'] as String?,
      json['previous'] as String?,
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PokemonBaseResponseToJson(
        PokemonBaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.pokemons,
    };

PokemonResponse _$PokemonResponseFromJson(Map<String, dynamic> json) =>
    PokemonResponse(
      json['name'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$PokemonResponseToJson(PokemonResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonDetailsResponse _$PokemonDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailsResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['sprites'] == null
          ? null
          : SpritesResponse.fromJson(json['sprites'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PokemonDetailsResponseToJson(
        PokemonDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'name': instance.name,
      'sprites': instance.sprites,
    };

SpritesResponse _$SpritesResponseFromJson(Map<String, dynamic> json) =>
    SpritesResponse(
      json['front_default'] as String?,
    );

Map<String, dynamic> _$SpritesResponseToJson(SpritesResponse instance) =>
    <String, dynamic>{
      'front_default': instance.image,
    };
