import 'package:demo/src/common_widgets/fade_in_animation/fade_in_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../constants/image_strings.dart';
import 'fade_in_animation_controllers.dart';

class TFadeInAnimation extends StatelessWidget {
   TFadeInAnimation({
     Key? key ,
     required this.durationInMs,
     required this.child,
     this.animate,
  }) : super (key:key);

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => AnimatedPositioned(
            duration: Duration(milliseconds: durationInMs),
            top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
            left: controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
            bottom: controller.animate.value ? animate!.bottomAfter : animate!.bottomBefore,
            right: controller.animate.value ? animate!.topAfter : animate!.topBefore,
            child: AnimatedOpacity(
              opacity: controller.animate.value ? 1 : 0,
              duration: Duration(milliseconds: durationInMs),
              child: child,
            ),
          ),
    );
  }
}