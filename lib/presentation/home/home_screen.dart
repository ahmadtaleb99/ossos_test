import 'package:flutter/material.dart';
import 'package:ossos_test/presentation/resources/strings_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.home),),
      body: Container(),
    );
  }
}
