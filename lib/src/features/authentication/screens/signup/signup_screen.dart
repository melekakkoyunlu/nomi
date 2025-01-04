import 'package:demo/src/common_widgets/form/form_header_widget.dart';
import 'package:demo/src/constants/image_strings.dart';
import 'package:demo/src/constants/sizes.dart';
import 'package:demo/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              FormHeaderWidget(
                  image: tLoginScreenImage1 ,
                  title: tSignTitle ,
                  subTitle: tSignSubTitle, ),
            ],
          ),
        ),
      ),

    );
 }
}