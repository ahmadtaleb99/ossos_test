import 'package:flutter/material.dart';
import 'package:ossos_test/presentation/resources/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,

    appBarTheme: AppBarTheme(
                  color: ColorManager.primary,
                      foregroundColor: Colors.white
    )
  );
}
