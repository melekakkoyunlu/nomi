import 'package:flutter/material.dart';
import 'package:demo/src/constants/colors.dart';
import 'package:demo/src/constants/sizes.dart';


class TElevatedButtonTheme{
  TElevatedButtonTheme._();

  /* Light Theme */
static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: tPrimaryColor ,
    backgroundColor: tSecondaryColor,
    side: BorderSide(color:tSecondaryColor),
    padding: EdgeInsets.symmetric(vertical: tButtonHeight),
  ),
);

  /* Dark Theme */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: tSecondaryColor ,
      backgroundColor: tPrimaryColor,
      side: BorderSide(color:tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}