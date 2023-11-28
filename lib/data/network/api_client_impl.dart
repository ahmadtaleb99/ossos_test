import 'package:dio/dio.dart';
import 'package:ossos_test/data/network/api_client.dart';
import 'package:ossos_test/data/network/api_constants.dart';
import 'package:ossos_test/data/responses/pokemon_response.dart';

class ApiClientImpl implements ApiClient {
  ApiClientImpl(
    this._dio,
  );

  final Dio _dio;

  @override
  Future<PokemonBaseResponse> getPokemonns(String page) async {
    final queryParameters = {'offset': page};
    final _result =
        await _dio.get(ApiConstants.pokemon, queryParameters: queryParameters);
    final value = PokemonBaseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<PokemonDetailsResponse> getPokemonDetails(String url) async {
    final _result = await _dio.get(url);
    final value = PokemonDetailsResponse.fromJson(_result.data);
    return value;
  }
}
