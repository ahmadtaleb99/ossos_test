
import 'package:dartz/dartz.dart';
import 'package:ossos_test/data/network/failure.dart';
import 'package:ossos_test/domain/model/models.dart';

abstract class PokemonsRepository   {
  Future<Either<Failure,List<Pokemon>>> getPokemons({required String page,});
}