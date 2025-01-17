import 'package:demo/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:demo/src/utils/theme/widget_themes/forget_password_btn_widget_theme.dart';
import 'package:demo/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:demo/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:demo/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class NomiAppTheme extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light;
  ThemeData get theme => themeMode == ThemeMode.light ? lightTheme : darkTheme;
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: NomiTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    extensions: const [ForgetPasswordButtonTheme.light],

  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: NomiTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    extensions: const [ForgetPasswordButtonTheme.dark],

  );
}