import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_mail/forget_password_mail.dart';
import '../forget_password_phone/forget_password_phone.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      isScrollControlled: true,
      builder: (context) =>
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tForgetPasswordTitle,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  Text(
                    tForgetPasswordSubTitle,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                  const SizedBox(height: 30.0),
                  //  --reset with email btn
                  ForgetPasswordBtnWidget(
                    btnIcon: Icons.mail_outline_rounded,
                    title: tEmail,
                    subTitle: tResetViaEMail,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => ForgetPasswordMailScreen());
                    },
                  ),
                  const SizedBox(height: 20.0),
                  //  --reset with phone no btn
                  ForgetPasswordBtnWidget(
                    btnIcon: Icons.mobile_friendly_rounded,
                    title: tPhoneNo,
                    subTitle: tResetViaPhone,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => ForgetPasswordPhoneScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
