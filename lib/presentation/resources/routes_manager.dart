
import 'package:flutter/material.dart';
import 'package:ossos_test/presentation/home/home_screen.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';

class Routes {
  static const String homeRoute = "/home";
  static const String splashRoute = "/splash";

}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (BuildContext context)  => const HomeScreen());
        break;


      default:
        return null;
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
