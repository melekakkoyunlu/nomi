import 'package:demo/src/common_widgets/fade_in_animation/fade_in_animation.dart';
import 'package:demo/src/constants/colors.dart';
import 'package:demo/src/constants/sizes.dart';
import 'package:demo/src/constants/text_strings.dart';
import 'package:demo/src/common_widgets/fade_in_animation/fade_in_animation_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../constants/image_strings.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs:1600 ,
            animate: TAnimatePosition(
              topAfter: 0 , topBefore: -30 , leftBefore: -30 , leftAfter: 0 ,
            ),
            child: const Image(image: AssetImage(tSplashIcon)),
          ),
          TFadeInAnimation(
              durationInMs: 2000,
              animate: TAnimatePosition(
                topBefore: 80 , topAfter: 80 , leftAfter: tDefaultSize , leftBefore: -80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    tAppTagLine,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
          ),
          TFadeInAnimation(
              durationInMs: 2400,
              animate: TAnimatePosition(
                bottomBefore: 0 , bottomAfter: 100,
              ),
              child: Image(
                image: AssetImage(tSplashImage),
              ),
          ),
          TFadeInAnimation(
              durationInMs: 2400,
              animate: TAnimatePosition(
                bottomBefore: 0 , bottomAfter: 60 , rightBefore: tDefaultSize , rightAfter: tDefaultSize,
              ) ,
              child: Container(
                width: tSplashContainerSize,
                height: tSplashContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: tPrimaryColor,
                ),
              ),
          ),
        ],
      ),
    );
  }
}


