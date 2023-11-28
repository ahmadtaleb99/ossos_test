

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ossos_test/app/MyApp.dart';
import 'package:ossos_test/app/dependency_injection.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();

  await initAppModules();

  runApp(MyApp());


}



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext ? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}