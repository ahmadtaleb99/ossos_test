import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_test/app/bloc/app_bloc.dart';
import 'package:ossos_test/presentation/resources/routes_manager.dart';
import 'package:ossos_test/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static final _instance = const MyApp._internal();

  factory MyApp() => _instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(427, 927),
        builder: (context, child) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return BlocProvider(

            create: (context) => AppBloc(),
            child: MaterialApp(
              initialRoute: Routes.splashRoute,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              theme: getApplicationTheme(),
              navigatorKey: _navigatorKey,
            ),
          );
        });
  }
}
