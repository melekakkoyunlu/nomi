import 'package:demo/firebase_options.dart';
import 'package:demo/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:demo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:demo/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value)=> Get.put(AuthenticationRepository()));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => NomiAppTheme()),
  ],
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<NomiAppTheme>(
    builder: (BuildContext context, viewModel, child) => GetMaterialApp(
      theme:viewModel.theme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
    ),);
  }
}




