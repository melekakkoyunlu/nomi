import 'package:demo/src/common_widgets/form/form_header_widget.dart';
import 'package:demo/src/constants/image_strings.dart';
import 'package:demo/src/constants/sizes.dart';
import 'package:demo/src/constants/text_strings.dart';
import 'package:demo/src/features/authentication/screens/login/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/login_footer_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: tLoginScreenImage1 ,
                  title: tLoginTitle,
                  subTitle: tLoginSubTitle,
                ),
                const LoginFormWidget(),
                const LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}





