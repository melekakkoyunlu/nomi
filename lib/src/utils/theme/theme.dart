import 'package:demo/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:demo/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:demo/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NomiAppTheme{

  NomiAppTheme. _();  //makes it private constructor

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: NomiTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: NomiTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  );
}