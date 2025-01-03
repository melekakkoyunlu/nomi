import 'package:demo/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:demo/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:NomiAppTheme.lightTheme,
      darkTheme: NomiAppTheme.darkTheme,
      themeMode:ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}




