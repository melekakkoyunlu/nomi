import 'package:demo/src/constants/sizes.dart';
import 'package:demo/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/text_strings.dart';
import '../../../models/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: tFormHeight-10),
      child: Form(
        key: _formKey,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: tFormHeight-20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight-20),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text(tPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: tFormHeight-20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: tFormHeight-20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      fullName: controller.fullName.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                    );
                    SignUpController.instance.createUser(user);
                  }
                },
                child: Text(tSign.toUpperCase()),
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}