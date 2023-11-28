import 'package:flutter/material.dart';
import 'package:ossos_test/presentation/resources/color_manager.dart';
import 'package:ossos_test/presentation/resources/font_manager.dart';
import 'package:ossos_test/presentation/resources/style_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    hintColor: ColorManager.hintColor,

    appBarTheme:
        AppBarTheme(color: ColorManager.lightPrimary, foregroundColor: Colors.white),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getMediumStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            foregroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),

    // text theme
    textTheme: TextTheme(
      bodyMedium:
          getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
    ),
  );
}
