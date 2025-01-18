import 'package:demo/src/features/map/screens/home/home_screen.dart';
import 'package:demo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(HomeScreen()): Get.back();
  }
}

/* OTP screens are ready , backend will be too
*  enable billing on firebase console
* */