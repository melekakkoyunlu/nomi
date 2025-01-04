import 'package:demo/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("OR"),
        const SizedBox(height: tFormHeight -20,),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(image: AssetImage(tGoogleLogo),width: 20.0,height: 20.0,),
            onPressed: (){},
            label: Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(
          height: tFormHeight -20,
        ),
        TextButton(
          onPressed: () => Get.to(() => const SignUpScreen()),
          child: Text.rich(
              TextSpan(
                  text: tDontHaveAnAccount,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: const [
                    TextSpan(
                      text: tSign,
                      style: TextStyle(color: Colors.blue),
                    )
                  ]
              )),
        ),
      ],
    );
  }
}