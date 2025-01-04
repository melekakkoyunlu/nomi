import 'package:flutter/material.dart';
import 'package:demo/src/constants/colors.dart';
import 'package:demo/src/constants/sizes.dart';


class TOutlinedButtonTheme{
  TOutlinedButtonTheme._();

  /* Light Theme */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: tSecondaryColor ,
      side: BorderSide(color:tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  /* Dark Theme */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: tPrimaryColor ,
      side: BorderSide(color:tPrimaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}