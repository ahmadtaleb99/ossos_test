
// ignore_for_file: unused_import



import 'package:get_it/get_it.dart';
import 'package:ossos_test/data/network/api_client.dart';
import 'package:ossos_test/data/network/dio_factory.dart';
import 'package:ossos_test/data/network/network_info.dart';
import 'package:ossos_test/data/repository_impl/pokemon_repository_impl.dart';
import 'package:ossos_test/domain/model/pokemons_repository.dart';

import '../data/network/api_client_impl.dart';

final getIt = GetIt.instance;







Future<void> initAppModules() async {
  //network info
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //dio Factoty
  getIt.registerLazySingleton(() => DioFactory());

  final dio = await getIt<DioFactory>().getDio();

  //api client
  getIt.registerLazySingleton<ApiClient>(() => ApiClientImpl(dio));


//repo

  getIt.registerLazySingleton<PokemonsRepository>(() =>
      PokemonsRepositoryImpl(
          getIt<NetworkInfo>(),
          getIt<ApiClient>()
      ));

  ///////////////////////////////////////

}