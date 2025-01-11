import 'package:demo/src/constants/sizes.dart';
import 'package:demo/src/constants/text_strings.dart';
import 'package:demo/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otp;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tOtpTitle,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Text(
                tOtpSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              Text(
                "$tOtpMessage support@nomi.com",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: screenWidth * 0.8,
                child: OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  fieldWidth: screenWidth * 0.1,
                  onSubmit: (code) {
                    otp = code;
                    OTPController.instance.verifyOTP(otp);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    OTPController.instance.verifyOTP(otp);
                  },
                  child: Text(tNext),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
