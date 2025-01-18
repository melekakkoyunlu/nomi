import 'package:demo/src/common_widgets/form/form_header_widget.dart';
import 'package:demo/src/constants/image_strings.dart';
import 'package:demo/src/constants/sizes.dart';
import 'package:demo/src/constants/text_strings.dart';
import 'package:demo/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                FormHeaderWidget(
                    image: tLoginScreenImage1 ,
                    title: tSignTitle ,
                    subTitle: tSignSubTitle,
                ),
                const SignUpFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                          onPressed: (){},
                          icon: const Image(image: AssetImage(tGoogleLogo), width: 30,) ,
                          label: const Text(tSignInWithGoogle),
                      ),
                    ),
                    TextButton(
                        onPressed: () => Get.to(() => const LoginScreen()),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: tAlreadyHaveAnAccount , style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: tLogin.toUpperCase()),
                            ]
                          )
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
 }
}

