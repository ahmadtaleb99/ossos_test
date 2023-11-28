

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ossos_test/app/MyApp.dart';
import 'package:ossos_test/app/dependency_injection.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await initAppModules();

  runApp(MyApp());


}


