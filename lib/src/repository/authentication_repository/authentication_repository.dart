import 'package:demo/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:demo/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:demo/src/features/map/screens/home/home_screen.dart';
import 'package:demo/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady(){
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(()=> SplashScreen()) : Get.offAll(() => HomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(()=> HomeScreen()) : Get.to(()=> const WelcomeScreen());
    } on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }catch (_){}
    const ex = SignUpWithEmailAndPasswordFailure();
    print('EXCEPTION - ${ex.message}');
    throw ex;
  }


Future<void> loginWithEmailAndPassword(String email, String password) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch(e) {
  }catch (_){}
}

Future<void> logout() async => await _auth.signOut();
}