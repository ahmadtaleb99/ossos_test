
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ossos_test/data/mapper/mapper.dart';
import 'package:ossos_test/data/network/api_client.dart';
import 'package:ossos_test/data/network/error_handler.dart';
import 'package:ossos_test/data/network/failure.dart';
import 'package:ossos_test/data/network/network_info.dart';
import 'package:ossos_test/domain/model/models.dart';
import 'package:ossos_test/domain/model/pokemons_repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository{


  final NetworkInfo _networkInfo;
  final ApiClient _apiClient;


  PokemonsRepositoryImpl(
      this._networkInfo, this._apiClient);

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons({required String page}) async {
    try {
      if (!await _networkInfo.isConnected) {
        return Left(ErrorTypeEnum.NO_INTERNET_CONNECTION.getFailure());
      }

      final pokemonsResponse = await  _apiClient.getPokemonns(page);
      if (pokemonsResponse.status == ApiInternal.FAILURE) {
        return Left(
            Failure(1, pokemonsResponse.message ?? ResponseMessage.UNKNOWN));
      }

      final pokemons = pokemonsResponse.toDomain();
      return Right(pokemons);
    } catch (error) {
      log(error.toString());
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, PokemonDetails>> getPokemonDetails({required String url}) async {


    try {
      if (!await _networkInfo.isConnected) {
        return Left(ErrorTypeEnum.NO_INTERNET_CONNECTION.getFailure());
      }

      final pokemonsResponse = await  _apiClient.getPokemonDetails(url);
      if (pokemonsResponse.status == ApiInternal.FAILURE) {
        return Left(
            Failure(1, pokemonsResponse.message ?? ResponseMessage.UNKNOWN));
      }

      final pokemon = pokemonsResponse.toDomain();
      return Right(pokemon);
    } catch (error) {
      log(error.toString());
      return Left(ErrorHandler.handle(error).failure);
    }


  }


}