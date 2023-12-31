import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ossos_test/app/dependency_injection.dart';
import 'package:ossos_test/domain/model/pokemons_repository.dart';
import 'package:ossos_test/presentation/animations/animations_page.dart';
import 'package:ossos_test/presentation/home/home_screen.dart';
import 'package:ossos_test/presentation/pokemons/bloc/pokemons_bloc.dart';
import 'package:ossos_test/presentation/pokemons/pokemons_page.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';
import 'package:ossos_test/presentation/splash/view/splash_screen.dart';

class Routes {
  static const String homeRoute = "/home";
  static const String splashRoute = "/splash";
  static const String animations = "/animations";
  static const String pokemons = "/pokemons";

}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case Routes.animations:
        return MaterialPageRoute(
            builder: (BuildContext context) => AnimationsPage());


      case Routes.pokemons:
        return MaterialPageRoute(builder: (BuildContext context) =>
            BlocProvider(
              create: (context) => PokemonsBloc(getIt<PokemonsRepository>())..add(PokemonsRequested()),
              child: const PokemonsPage(),
            ));

      default:
        return null;
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
