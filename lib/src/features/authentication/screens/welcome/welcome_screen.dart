import 'package:demo/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:demo/src/common_widgets/fade_in_animation/fade_in_animation.dart';
import 'package:demo/src/common_widgets/fade_in_animation/fade_in_animation_controllers.dart';
import 'package:demo/src/constants/colors.dart';
import 'package:demo/src/constants/image_strings.dart';
import 'package:demo/src/constants/sizes.dart';
import 'package:demo/src/constants/text_strings.dart';
import 'package:demo/src/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tAccentColor : tPrimaryColor,
      body:Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animate: TAnimatePosition(
                bottomAfter: 0 , bottomBefore: -100 ,
                leftAfter: 0 , leftBefore: 0 ,
                topAfter: 0 , topBefore: 0 ,
                rightAfter: 0 , rightBefore: 0 ,
            ),
            child: Container(
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage(tWelcomeScreenImage),height: height * 0.60),
                  Column(
                    children: [
                      Text(tWelcomeTitle, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                      Text(tWelcomeSubTitle,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: OutlinedButton(
                          onPressed: () => Get.to(() => const LoginScreen()),
                          child: Text(tLogin)
                      ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(child: ElevatedButton(
                          onPressed: () => Get.to(() => const SignUpScreen()),
                          child: Text(tSign)
                      ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}