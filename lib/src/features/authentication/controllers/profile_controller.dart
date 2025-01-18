import 'package:get/get.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../../../features/authentication/models/user_model.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _userRepo = Get.put(UserRepository());
  final _authRepo = Get.put(AuthenticationRepository());
  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  updateRecord(UserModel user) async {
      await _userRepo.updateUserRecord(user);
  }

}