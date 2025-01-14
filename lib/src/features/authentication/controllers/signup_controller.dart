import 'package:demo/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:demo/src/repository/authentication_repository/authentication_repository.dart';
import 'package:demo/src/repository/user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../map/screens/home/home_screen.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //Call this Function from Design & it will do the rest
  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user.email, user.password, user.fullName, user.phoneNo);
    phoneAuthentication(user.phoneNo);
    Get.to(() => HomeScreen());
  }

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}

